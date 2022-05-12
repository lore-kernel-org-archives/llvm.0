Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C19972F21
	for <llvm@lists.linux.dev>; Thu, 12 May 2022 11:42:28 +0000 (UTC)
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1652355746;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=EVKP/CYD5WiRAwea0fTycBrdnFzk/dVADr23qqt3y6E=;
	b=yrM5b6CodxR2cEHq4O3/hGD/yoinjSXq508BQzpZXowAZKXggW7cRyLYPM17mprPsosYk8
	y9PSIdLgVvo8aYVBhWwA5DKYgK0MCuaHNGHNw9WypMDVzm5IAvh8l2++DiS2jD484+QY75
	vKdaG3yKz6by4RwQkOy4V91hgeKiHqLzbQt+P6SjO9WDnbf31AbOXICv4hXgOToeC6tBgV
	rMiFxfAIyxO5DTXfoBVD5quJgNt+ZQnLQ8p534EeigGoO6fyFFkrw2q0fqYzjYQsFiuoAa
	7BRkXVWjLgLnXXWZf4u7AmVNl5yWu++tVq2puGNxkGbvtuBYcLGX3y+tP9/lDA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1652355746;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=EVKP/CYD5WiRAwea0fTycBrdnFzk/dVADr23qqt3y6E=;
	b=xf0GqhLbq32Lzl8BtioR0084QfhMYTfAm3uM6gWUTLub59ppH2+6ubDOuiv8IvhfmlciBg
	NlrQ+MLhYo704wBw==
To: Hans de Goede <hdegoede@redhat.com>, kernel test robot <lkp@intel.com>,
 Peter Zijlstra <peterz@infradead.org>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org, Andy Shevchenko
 <andriy.shevchenko@linux.intel.com>, linux-kernel@vger.kernel.org, Tony
 Luck <tony.luck@intel.com>
Subject: Re: [pdx86-platform-drivers-x86:review-hans 46/59]
 kernel/stop_machine.c:638:35: error: call to undeclared function
 'cpu_smt_mask'; ISO C99 and later do not support implicit function
 declarations
In-Reply-To: <ce8e9601-f514-5227-f9f7-87594218f95f@redhat.com>
References: <202205120904.Gr9HEY5E-lkp@intel.com> <87zgjnw1bg.ffs@tglx>
 <ce8e9601-f514-5227-f9f7-87594218f95f@redhat.com>
Date: Thu, 12 May 2022 13:42:26 +0200
Message-ID: <87r14zvuxp.ffs@tglx>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain

On Thu, May 12 2022 at 11:53, Hans de Goede wrote:
> On 5/12/22 11:24, Thomas Gleixner wrote:
>> On Thu, May 12 2022 at 09:29, kernel test robot wrote:
>>>>> kernel/stop_machine.c:638:35: error: call to undeclared function 'cpu_smt_mask'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
>>>            const struct cpumask *smt_mask = cpu_smt_mask(cpu);
>> 
>> This warning with W=1 is not the worst of the problems.
>> 
>> The build will simply fail for CONFIG_SMP=y && CONFIG_SCHED_SMT=n
>> because cpu_smt_mask() cannot be resolved.
>> 
>> The other issue is CONFIG_SMP=n. This will fail to build the IFS driver
>> because stop_core_cpuslocked() is not available for SMP=n.
>
> The IFS Kconfig already depends on SMP :
>
> config INTEL_IFS
>         tristate "Intel In Field Scan"
>         depends on X86 && 64BIT && SMP
>         select INTEL_IFS_DEVICE
>         help
>           Enable ...
>
>
> So I don't think we need the non-SMP implementation inside
> include/linux/stop_machine.h, we only need the #ifdef you
> suggest in kernel/stop_machine.c  ?

For the case at hand that's sufficient.

> I think it is best to just squash this into the original
> patch, do you agree ?

Yes.
