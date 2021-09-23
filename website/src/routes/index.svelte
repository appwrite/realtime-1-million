<script lang="ts">
	import Chart from './_chart.svelte';
	import logo from '../logo.svg';
	import '@fontsource/poppins';

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
			description: 'Response time at a given point of time. <br /><br />As seen, the response time was very constant until the limit of one million connections was reached.',
			metrics: [
				{
					name: 'Connect',
					description: 'Duration in <b>milliseconds</b> of the handshake.'
				},
				{
					name: 'Request',
					description: 'Response time in <b>milliseconds</b> for establishing the connection.'
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
				'Errors that occured when trying to connect or during an already established connection.  <br /><br />As seen, there were no errors until the limit of one million connections was reached.',
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
				'The respective value of what percentage is actually being utilized. The CPU usage is an indicator of how much stress the processor is currently undergoing, and, what capacity is still available. <br /><br /> The drop at 500 seconds results from no more new connections are established. That means, the last value reflects the load to maintain all connections.',
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
			description: 'Amount of system memory used over time in MB.',
			metrics: [
				{
					name: 'Used',
					description: 'Used memory in MB.'
				}
			]
		}
	];
</script>

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

<section class="section is-medium has-background-light">
	<div class="container has-text-centered">
		<div class="columns">
			<div class="column">
				<h3 class="title is-1">1,000,382</h3>
				<span class="subtitle">Connected Users</span>
			</div>
			<div class="column">
				<h3 class="title is-1">440.06 MB</h3>
				<span class="subtitle">Total Network Traffic</span>
			</div>
			<div class="column">
				<h3 class="title is-1">2.58 ms</h3>
				<span class="subtitle">Average Response Time</span>
			</div>
		</div>
	</div>
</section>

<section class="section is-medium">
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

<section class="section is-medium has-background-light">
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

<style lang="scss">
	.logo {
		max-width: 16rem;
		aspect-ratio: attr(width) / attr(height);
	}
</style>
