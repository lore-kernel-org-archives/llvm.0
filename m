Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9746FBE7C;
	Fri,  4 Aug 2023 16:51:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 54267C433C7;
	Fri,  4 Aug 2023 16:51:09 +0000 (UTC)
Date: Fri, 4 Aug 2023 12:51:07 -0400
From: Steven Rostedt <rostedt@goodmis.org>
To: kernel test robot <lkp@intel.com>
Cc: Zheng Yejian <zhengyejian1@huawei.com>, mhiramat@kernel.org,
 vnagarnaik@google.com, shuah@kernel.org, llvm@lists.linux.dev,
 oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
 linux-trace-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org
Subject: Re: [PATCH 1/2] tracing: Fix cpu buffers unavailable due to
 'record_disabled' messed
Message-ID: <20230804125107.41d6cdb1@gandalf.local.home>
In-Reply-To: <202308050048.bUnVeBjV-lkp@intel.com>
References: <20230804124549.2562977-2-zhengyejian1@huawei.com>
	<202308050048.bUnVeBjV-lkp@intel.com>
X-Mailer: Claws Mail 3.19.1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Sat, 5 Aug 2023 00:41:13 +0800
kernel test robot <lkp@intel.com> wrote:

>   5276			if (cpumask_test_cpu(cpu, tr->tracing_cpumask) &&
>   5277					!cpumask_test_cpu(cpu, tracing_cpumask_new)) {
>   5278				atomic_inc(&per_cpu_ptr(tr->array_buffer.data, cpu)->disabled);
>   5279				ring_buffer_record_disable_cpu(tr->array_buffer.buffer, cpu);
> > 5280				ring_buffer_record_disable_cpu(tr->max_buffer.buffer, cpu);  

The access to max_buffer requires a:

#ifdef CONFIG_TRACER_MAX_TRACE

Around them.

-- Steve

>   5281			}
>   5282			if (!cpumask_test_cpu(cpu, tr->tracing_cpumask) &&
>   5283					cpumask_test_cpu(cpu, tracing_cpumask_new)) {
>   5284				atomic_dec(&per_cpu_ptr(tr->array_buffer.data, cpu)->disabled);
>   5285				ring_buffer_record_enable_cpu(tr->array_buffer.buffer, cpu);
>   5286				ring_buffer_record_enable_cpu(tr->max_buffer.buffer, cpu);
>   5287			}
>   5288		}
>   5289		arch_spin_unlock(&tr->max_lock);
