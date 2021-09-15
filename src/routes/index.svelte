<script lang="ts">
	import Chart from './_chart.svelte';
	import logo from '../logo.svg';
	import Footer from './_footer.svelte';

	type ChartType = {
		title: string;
		file: string;
		description: string;
		metrics: {
			name: string;
			description: string;
		}[];
	};
	const statistics: ChartType[] = [
		{
			title: 'Simultaneous Users',
			file: 'csv_data/graphes-users-simultaneous.csv',
			description: 'Number of simultaneous users connected over time.',
			metrics: [
				{
					name: 'Users',
					description: 'Number of simultaneous users.'
				},
				{
					name: 'Connected',
					description: 'Number of users with an opened connection.'
				}
			]
		},
		{
			title: 'Response Times',
			file: 'csv_data/graphes-perfs-mean.csv',
			description: 'Response time at a given point of time.',
			metrics: [
				{
					name: 'Connect',
					description: 'Duration in <b>milliseconds</b> of the connection establishment.'
				},
				{
					name: 'Request',
					description: 'Response time in milliseconds for the request.'
				}
			]
		},
		{
			title: 'Traffic',
			file: 'csv_data/graphes-size-rate.csv',
			description:
				'Network traffic or data traffic moving across the network at a given point of time.',
			metrics: [
				{
					name: 'Sent',
					description: 'Size of requests in bytes.'
				},
				{
					name: 'Received',
					description: 'Size of responses in bytes.'
				}
			]
		},
		{
			title: 'Errors',
			file: 'csv_data/graphes-errors-rate.csv',
			description:
				'Errors that occured when trying to connect or during an already established connection.',
			metrics: [
				{
					name: 'Connect',
					description: 'Number of connections that failing to connect.'
				},
				{
					name: 'Disconnect',
					description: 'Number of connections that disconnected.'
				}
			]
		}
	];

	const performances: ChartType[] = [
		{
			title: 'Usage',
			file: 'csv_data/graphes-cpu-mean.csv',
			description:
				'The respective value of what percentage is actually being utilized. The CPU usage is an indicator of how much stress the processor is currently undergoing, and, what capacity is still available.',
			metrics: [
				{
					name: 'Usage',
					description: 'CPU Usage in %.'
				}
			]
		},
		{
			title: 'Load',
			file: 'csv_data/graphes-load-mean.csv',
			description:
				'The load represents the average system load over a period of time. 1.0 on a single core cpu represents 100% utilization. <br />Note that this benchmark is using a machine with 32 cores.',
			metrics: [
				{
					name: 'Load',
					description: 'CPU Load by cores.'
				}
			]
		},
		{
			title: 'Memory',
			file: 'csv_data/graphes-freemem-mean.csv',
			description: 'Amount of memory used over time in megabytes.',
			metrics: [
				{
					name: 'Free',
					description: 'Free memory in MB.'
				}
			]
		}
	];
</script>

<svelte:head>
	<title>Appwrite - 1 Million Benchmark</title>
	<meta name="description" content="Appwrite's benchmark to 1 Million connection with Realtime." />
</svelte:head>

<section class="hero is-primary is-halfheight">
	<div class="hero-body">
		<div class="container has-text-centered">
			<img class="logo" alt="Appwrite" src={logo} width="256" height="64" />
			<h1 class="title">Realtime to the Million!</h1>
		</div>
	</div>
</section>

<section class="section is-medium">
	<div class="container has-text-centered">
		<h2 class="title is-2">Statistics</h2>
		<p>
			This benchmark was performed with a single WebSocket Server and 16 machines connecting to this
			server.
		</p>
		{#each statistics as statistic}
			<Chart file={statistic.file}>
				<h3 class="subtitle is-4">
					{statistic.title}
				</h3>
				<p>{@html statistic.description}</p>
				<table class="table is-fullwidth mt-4">
					<thead>
						<tr>
							<th>Metric</th>
							<th>Description</th>
						</tr>
					</thead>
					<tbody>
						{#each statistic.metrics as metric}
							<tr>
								<td>{metric.name}</td>
								<td>{@html metric.description}</td>
							</tr>
						{/each}
					</tbody>
				</table>
			</Chart>
		{/each}
	</div>
</section>

<section class="section is-medium has-background-light	">
	<div class="container has-text-centered">
		<h2 class="title is-2">Performance</h2>
		<p>
			This benchmark was performed on a DigitalOcean General Purpose Droplet with 32 cores and 128
			GB of memory.
		</p>
		{#each performances as performance}
			<Chart file={performance.file}>
				<h3 class="subtitle is-4">
					{performance.title}
				</h3>
				<p>{@html performance.description}</p>
				<table class="table is-fullwidth mt-4">
					<thead>
						<tr>
							<th>Metric</th>
							<th>Description</th>
						</tr>
					</thead>
					<tbody>
						{#each performance.metrics as metric}
							<tr>
								<td>{metric.name}</td>
								<td>{@html metric.description}</td>
							</tr>
						{/each}
					</tbody>
				</table>
			</Chart>
		{/each}
	</div>
</section>

<section class="section is-medium">
	<div class="container has-text-centered">
		<h2 class="title is-2 is-spaced">FAQ</h2>
		<h3 class="subtitle is-4">What software was used?</h3>
		<p class="mb-6">
			We used <a href="https://github.com/processone/tsung" rel="noopener" target="_blank">Tsung</a>
			to do the benchmark.
		</p>
		<h3 class="subtitle is-4">Can I see more?</h3>
		<p class="mb-6">
			The generated report including all logs can be found <a
				href="https://github.com/appwrite/realtime-1-million/raw/main/benchmark.tar.gz"
				rel="noopener"
				target="_blank">on GitHub</a
			>.
		</p>
	</div>
</section>

<Footer />

<style lang="scss">
	.logo {
		max-width: 16rem;
		aspect-ratio: attr(width) / attr(height);
	}
</style>
