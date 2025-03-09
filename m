Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A51A7632;
	Sun,  9 Mar 2025 19:20:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=93.17.235.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741548006; cv=none; b=DYAOwSaYm2Hu/059hkeJ2HVIQFFqZeKin1xo0DEgo5uJCP0K+THuvfc90N/5NeImUVNmv+2QifksrW/lxGWnFFCwbhDi0dWTsLj7oRFUDVc13sHWVe2utLOM11Xsv5rSfUsBjGmQuH6uQmrMDlRc2j6W5I0zcGF+HoRfVi3htso=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741548006; c=relaxed/simple;
	bh=psatQdlUUGYu/oraQfaPpXeNoJhIqRIX1zOYmpOfZSQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=HzMj1AN/BsSvoGLYYLSq1/aQhaqhy9S7dc7CY0CNVe2Ywqp1joTd95dkNf2HY6tIaYgWr2KQf8YvgzBYylrYKHIMN4R3eak/3u5VDNjHDXR+TxXIDh+EwPVmya6IzvwK5ce1+XmIpdaiJPDtjkeq+oY/YZ1p61IJ6U+HChroGSU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu; spf=pass smtp.mailfrom=csgroup.eu; arc=none smtp.client-ip=93.17.235.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=csgroup.eu
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
	by localhost (Postfix) with ESMTP id 4Z9pvs2Sgyz9sgJ;
	Sun,  9 Mar 2025 19:48:57 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
	by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Vn_rAKUH5xiV; Sun,  9 Mar 2025 19:48:57 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase2.c-s.fr (Postfix) with ESMTP id 4Z9pvs0Znqz9sgH;
	Sun,  9 Mar 2025 19:48:57 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id F32678B765;
	Sun,  9 Mar 2025 19:48:56 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id zwW5rIwsYnQA; Sun,  9 Mar 2025 19:48:56 +0100 (CET)
Received: from [192.168.235.99] (unknown [192.168.235.99])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 665AA8B764;
	Sun,  9 Mar 2025 19:48:56 +0100 (CET)
Message-ID: <4967dc7d-dc87-48d9-a44d-2d667c2841f0@csgroup.eu>
Date: Sun, 9 Mar 2025 19:48:56 +0100
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [linux-next:master 3203/9634]
 arch/powerpc/include/asm/bitops.h:126:26: error: constraint 'n' expects an
 integer constant expression
To: Andrea Righi <arighi@nvidia.com>, kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, Tejun Heo <tj@kernel.org>,
 Yury Norov <yury.norov@gmail.com>, clang-built-linux@googlegroups.com,
 "llvm@lists.linux.dev" <llvm@lists.linux.dev>
References: <202503090435.wITkzD2e-lkp@intel.com> <Z81TSQHHaNq_Aj4x@gpd3>
Content-Language: fr-FR
From: Christophe Leroy <christophe.leroy@csgroup.eu>
In-Reply-To: <Z81TSQHHaNq_Aj4x@gpd3>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



Le 09/03/2025 à 09:37, Andrea Righi a écrit :
> [Vous ne recevez pas souvent de courriers de arighi@nvidia.com. D?couvrez pourquoi ceci est important ? https://aka.ms/LearnAboutSenderIdentification ]
> 
> On Sun, Mar 09, 2025 at 04:56:45AM +0800, kernel test robot wrote:
>> tree:   https://eur01.safelinks.protection.outlook.com/?url=https%3A%2F%2Fgit.kernel.org%2Fpub%2Fscm%2Flinux%2Fkernel%2Fgit%2Fnext%2Flinux-next.git&data=05%7C02%7Cchristophe.leroy%40csgroup.eu%7C01ad01407fee4a03676d08dd5ee5a99d%7C8b87af7d86474dc78df45f69a2011bb5%7C0%7C0%7C638771062684017698%7CUnknown%7CTWFpbGZsb3d8eyJFbXB0eU1hcGkiOnRydWUsIlYiOiIwLjAuMDAwMCIsIlAiOiJXaW4zMiIsIkFOIjoiTWFpbCIsIldUIjoyfQ%3D%3D%7C0%7C%7C%7C&sdata=lK0Vy%2F4o95CtQF5szPezehhmcdFjDEGgf6JWYRIG%2FcY%3D&reserved=0 master
>> head:   0a2f889128969dab41861b6e40111aa03dc57014
>> commit: 48849271e66114cb980a3bc44218b04d0f8cdcdd [3203/9634] sched_ext: idle: Per-node idle cpumasks
>> config: powerpc-randconfig-r112-20250308 (https://eur01.safelinks.protection.outlook.com/?url=https%3A%2F%2Fdownload.01.org%2F0day-ci%2Farchive%2F20250309%2F202503090435.wITkzD2e-lkp%40intel.com%2Fconfig&data=05%7C02%7Cchristophe.leroy%40csgroup.eu%7C01ad01407fee4a03676d08dd5ee5a99d%7C8b87af7d86474dc78df45f69a2011bb5%7C0%7C0%7C638771062687408543%7CUnknown%7CTWFpbGZsb3d8eyJFbXB0eU1hcGkiOnRydWUsIlYiOiIwLjAuMDAwMCIsIlAiOiJXaW4zMiIsIkFOIjoiTWFpbCIsIldUIjoyfQ%3D%3D%7C0%7C%7C%7C&sdata=dNaCIS1An989v%2BhSzWt0F1M33pxzf0WO6G09wU3%2F90s%3D&reserved=0)
>> compiler: clang version 18.1.8 (https://eur01.safelinks.protection.outlook.com/?url=https%3A%2F%2Fgithub.com%2Fllvm%2Fllvm-project&data=05%7C02%7Cchristophe.leroy%40csgroup.eu%7C01ad01407fee4a03676d08dd5ee5a99d%7C8b87af7d86474dc78df45f69a2011bb5%7C0%7C0%7C638771062687416861%7CUnknown%7CTWFpbGZsb3d8eyJFbXB0eU1hcGkiOnRydWUsIlYiOiIwLjAuMDAwMCIsIlAiOiJXaW4zMiIsIkFOIjoiTWFpbCIsIldUIjoyfQ%3D%3D%7C0%7C%7C%7C&sdata=bBHENBhnCpqHz2ErtwY4iMTakfvmq5kumF0BVqN6hKQ%3D&reserved=0 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
>> reproduce: (https://eur01.safelinks.protection.outlook.com/?url=https%3A%2F%2Fdownload.01.org%2F0day-ci%2Farchive%2F20250309%2F202503090435.wITkzD2e-lkp%40intel.com%2Freproduce&data=05%7C02%7Cchristophe.leroy%40csgroup.eu%7C01ad01407fee4a03676d08dd5ee5a99d%7C8b87af7d86474dc78df45f69a2011bb5%7C0%7C0%7C638771062687424999%7CUnknown%7CTWFpbGZsb3d8eyJFbXB0eU1hcGkiOnRydWUsIlYiOiIwLjAuMDAwMCIsIlAiOiJXaW4zMiIsIkFOIjoiTWFpbCIsIldUIjoyfQ%3D%3D%7C0%7C%7C%7C&sdata=Wm6O%2BaoClsBaKLXtVLOi4uDpPVx6z%2FoXnE6LF%2BMnBH8%3D&reserved=0)
>>
>> If you fix the issue in a separate patch/commit (i.e. not just a new version of
>> the same patch/commit), kindly add following tags
>> | Reported-by: kernel test robot <lkp@intel.com>
>> | Closes: https://eur01.safelinks.protection.outlook.com/?url=https%3A%2F%2Flore.kernel.org%2Foe-kbuild-all%2F202503090435.wITkzD2e-lkp%40intel.com%2F&data=05%7C02%7Cchristophe.leroy%40csgroup.eu%7C01ad01407fee4a03676d08dd5ee5a99d%7C8b87af7d86474dc78df45f69a2011bb5%7C0%7C0%7C638771062687433012%7CUnknown%7CTWFpbGZsb3d8eyJFbXB0eU1hcGkiOnRydWUsIlYiOiIwLjAuMDAwMCIsIlAiOiJXaW4zMiIsIkFOIjoiTWFpbCIsIldUIjoyfQ%3D%3D%7C0%7C%7C%7C&sdata=vh%2BADDGxZZJblkU6V0NlC9VPlK2ZgQQWfTCdRMtfXNY%3D&reserved=0
>>
>> All errors (new ones prefixed by >>):
>>
>>     In file included from kernel/sched/build_policy.c:16:
>>     In file included from include/linux/sched/clock.h:5:
>>     In file included from include/linux/smp.h:13:
>>     In file included from include/linux/cpumask.h:11:
>>     In file included from include/linux/kernel.h:23:
>>     In file included from include/linux/bitops.h:68:
>>>> arch/powerpc/include/asm/bitops.h:126:26: error: constraint 'n' expects an integer constant expression
>>       126 | DEFINE_CLROP(clear_bits, "")
>>           |                          ^
>>     1 error generated.
> 
> I've expanded the for_each_node_numadist() macro to better understand
> what's going on, it seems that clang isn't happy with a node_clear() inside
> the for loop, and it's not complaining about a similar node_clear() outside
> the for loop.
> 
> Also, it seems to happen only with clang (gcc is always happy).
> 
> Here's the relevant code (with the macro expanded and comments removed):
> 
> ===
> static DEFINE_PER_CPU(nodemask_t, per_cpu_unvisited);
> 
> static s32 pick_idle_cpu_from_online_nodes(const struct cpumask *cpus_allowed, int node, u64 flags)
> {
>          nodemask_t *unvisited;
>          s32 cpu = -EBUSY;
> 
>          preempt_disable();
>          unvisited = this_cpu_ptr(&per_cpu_unvisited);
> 
>          nodes_copy(*unvisited, node_states[N_ONLINE]);
>          node_clear(node, *unvisited);
> 
>          for (int __start = node,
>               node = nearest_node_nodemask(__start, unvisited);
>               node < MAX_NUMNODES;
>               // node_clear(node, *unvisited), <- clang is happy with this one commented!
>               node = nearest_node_nodemask(__start, unvisited)) {
>                  cpu = pick_idle_cpu_in_node(cpus_allowed, node, flags);
>                  if (cpu >= 0)
>                          break;
>          }
>          preempt_enable();
> 
>          return cpu;
> }
> ===
> 
> The code looks correct to me, but I don't know much about powerpc assembly.
> Christophe, maybe you have a better idea of what's happening here?

#define DEFINE_CLROP(fn, prefix)					\
static inline void fn(unsigned long mask, volatile unsigned long *_p)	\
{									\
	unsigned long old;						\
	unsigned long *p = (unsigned long *)_p;				\
									\
	if (IS_ENABLED(CONFIG_PPC32) &&					\
	    __builtin_constant_p(mask) && is_rlwinm_mask_valid(~mask)) {\
		asm volatile (						\
			prefix						\
		"1:"	"lwarx	%0,0,%3\n"				\
			"rlwinm	%0,%0,0,%2\n"				\
			"stwcx.	%0,0,%3\n"				\
			"bne- 1b\n"					\
			: "=&r" (old), "+m" (*p)			\
			: "n" (~mask), "r" (p)				\
			: "cc", "memory");				\
	} else {							\
		asm volatile (						\
			prefix						\
		"1:"	PPC_LLARX "%0,0,%3,0\n"				\
			"andc %0,%0,%2\n"				\
			PPC_STLCX "%0,0,%3\n"				\
			"bne- 1b\n"					\
			: "=&r" (old), "+m" (*p)			\
			: "r" (mask), "r" (p)				\
			: "cc", "memory");				\
	}								\
}


clang says "constraint 'n' expects an integer constant expression" ?

The only place I see 'n' constraint in that macro is the '"n" (~mask)' 
in the if __builtin_constant_p(mask) branch. As far as I know if mask is 
a constant (~mask) is also a constant ?

Must be a clang bug ?

Maybe try with __builtin_constant_p(~mask) instead of 
__builtin_constant_p(mask)

Christophe

> 
> Thanks,
> -Andrea
> 
>>
>>
>> vim +/n +126 arch/powerpc/include/asm/bitops.h
>>
>> fb350784d8d179 Christophe Leroy 2021-09-21  125
>> fb350784d8d179 Christophe Leroy 2021-09-21 @126  DEFINE_CLROP(clear_bits, "")
>> fb350784d8d179 Christophe Leroy 2021-09-21  127  DEFINE_CLROP(clear_bits_unlock, PPC_RELEASE_BARRIER)
>> fb350784d8d179 Christophe Leroy 2021-09-21  128
>>
>> :::::: The code at line 126 was first introduced by commit
>> :::::: fb350784d8d17952afa93383bb47aaa6b715c459 powerpc/bitops: Use immediate operand when possible
>>
>> :::::: TO: Christophe Leroy <christophe.leroy@csgroup.eu>
>> :::::: CC: Michael Ellerman <mpe@ellerman.id.au>
>>
>> --
>> 0-DAY CI Kernel Test Service
>> https://eur01.safelinks.protection.outlook.com/?url=https%3A%2F%2Fgithub.com%2Fintel%2Flkp-tests%2Fwiki&data=05%7C02%7Cchristophe.leroy%40csgroup.eu%7C01ad01407fee4a03676d08dd5ee5a99d%7C8b87af7d86474dc78df45f69a2011bb5%7C0%7C0%7C638771062687441670%7CUnknown%7CTWFpbGZsb3d8eyJFbXB0eU1hcGkiOnRydWUsIlYiOiIwLjAuMDAwMCIsIlAiOiJXaW4zMiIsIkFOIjoiTWFpbCIsIldUIjoyfQ%3D%3D%7C0%7C%7C%7C&sdata=y4xmCm57X1U8WeYk2lPntirA60ajGxiW6u2xjp3t580%3D&reserved=0

