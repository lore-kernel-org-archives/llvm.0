Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B9B528F3
	for <llvm@lists.linux.dev>; Thu, 12 May 2022 09:24:37 +0000 (UTC)
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1652347475;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=5jcKtldk0WOKNaTgVC8yTdE9lAVcyBOlHloXurBqbWM=;
	b=l/KS11AxDRJwet+ggUp0GCbuN+tUBNaNQbTd4glxlHoxdHMdLlA+CyqjkAMZgUpSJC3cOS
	9KD0gl6V00xqIiuzhFGd/KO4ziyiDc/sFqLpepQuwX7pfqogBbBlA5NmQWBUrPWCbrHn0a
	k8w0MlC5XyPvWSg718Yt15XtCnOPNVnUYhHiwUCBaL5UafQWBn1IN5v+gr7hI3QOeBLzOZ
	DsqqLPX1G0un2f7N2B8D3ReiFWvBv8NnSJ4OhSz37LGR8iSnZ8JyXLs9L1ilQXbf2mdJLd
	gT99SQ01BGt1pDnlsPF4FavOjH7vplYHrDMtEG7HKpWe55T0NqJ5VjrnY93Kdw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1652347475;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=5jcKtldk0WOKNaTgVC8yTdE9lAVcyBOlHloXurBqbWM=;
	b=x5X6Awd6fY2gyIwuXJMyuzN0Jju7ct7vU2gD0TbrdlAn/YW/8KlHtMnVgTRVYkKTdyW0ki
	wOedVGw9iz/OFnAw==
To: kernel test robot <lkp@intel.com>, Peter Zijlstra <peterz@infradead.org>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org, Andy Shevchenko
 <andriy.shevchenko@linux.intel.com>, Hans de Goede <hdegoede@redhat.com>,
 linux-kernel@vger.kernel.org, Tony Luck <tony.luck@intel.com>
Subject: Re: [pdx86-platform-drivers-x86:review-hans 46/59]
 kernel/stop_machine.c:638:35: error: call to undeclared function
 'cpu_smt_mask'; ISO C99 and later do not support implicit function
 declarations
In-Reply-To: <202205120904.Gr9HEY5E-lkp@intel.com>
References: <202205120904.Gr9HEY5E-lkp@intel.com>
Date: Thu, 12 May 2022 11:24:35 +0200
Message-ID: <87zgjnw1bg.ffs@tglx>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain

On Thu, May 12 2022 at 09:29, kernel test robot wrote:
>>> kernel/stop_machine.c:638:35: error: call to undeclared function 'cpu_smt_mask'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
>            const struct cpumask *smt_mask = cpu_smt_mask(cpu);

This warning with W=1 is not the worst of the problems.

The build will simply fail for CONFIG_SMP=y && CONFIG_SCHED_SMT=n
because cpu_smt_mask() cannot be resolved.

The other issue is CONFIG_SMP=n. This will fail to build the IFS driver
because stop_core_cpuslocked() is not available for SMP=n.

Something like the below should work as x86 selects SCHED_SMT when
SMP=y.

Thanks,

        tglx
---
--- a/include/linux/stop_machine.h
+++ b/include/linux/stop_machine.h
@@ -156,6 +156,12 @@ static __always_inline int stop_machine_
 }
 
 static __always_inline int
+stop_core_cpuslocked(unsigned int cpu, cpu_stop_fn_t fn, void *data)
+{
+	return stop_machine_cpuslocked(fn, data, NULL);
+}
+
+static __always_inline int
 stop_machine(cpu_stop_fn_t fn, void *data, const struct cpumask *cpus)
 {
 	return stop_machine_cpuslocked(fn, data, cpus);
--- a/kernel/stop_machine.c
+++ b/kernel/stop_machine.c
@@ -631,6 +631,7 @@ int stop_machine(cpu_stop_fn_t fn, void
 }
 EXPORT_SYMBOL_GPL(stop_machine);
 
+#ifdef CONFIG_SCHED_SMT
 int stop_core_cpuslocked(unsigned int cpu, cpu_stop_fn_t fn, void *data)
 {
 	const struct cpumask *smt_mask = cpu_smt_mask(cpu);
@@ -649,6 +650,7 @@ int stop_core_cpuslocked(unsigned int cp
 	return stop_cpus(smt_mask, multi_cpu_stop, &msdata);
 }
 EXPORT_SYMBOL_GPL(stop_core_cpuslocked);
+#endif
 
 /**
  * stop_machine_from_inactive_cpu - stop_machine() from inactive CPU



