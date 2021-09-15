<script lang="ts">
	import type { dygraphs } from 'dygraphs';
	import { onMount } from 'svelte';

	export let file: string;

	let container: HTMLDivElement;

	onMount(async () => {
		const Dygraph = (await import('dygraphs')).default;
		const graphOptions: dygraphs.Options = {
			legendFormatter: (data) => {
				if (data.x == null) return ''; // no selection
				const colors = data.dygraph.getColors();
				return (
					`<div class="box is-size-7">At ${data.xHTML} seconds<br />` +
					data.series
						.map(
							(v, i) => `<span style="color: ${colors[i]}">${v.labelHTML}: ${v.yHTML}</span><br />`
						)
						.join(' ') +
					'</div>'
				);
			},
			legend: 'follow',
			labelsSeparateLines: true
		};
		new Dygraph(container, file, graphOptions);
	});
</script>

<div class="columns my-6">
	<div class="column">
		<div style="width: 100%;" bind:this={container} />
	</div>
	<div class="column is-one-third has-text-left is-size-7">
		<slot />
	</div>
</div>

<style>
	:global(.dygraph-legend) {
		position: absolute;
	}
</style>
