Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4480B7B;
	Wed, 15 Feb 2023 17:05:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1676480759; x=1708016759;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=kLIr9p0ZFmvUPdNp/5aHOLNEUKW2A54/clmzlf/4Hyg=;
  b=DNS83rbY4fTHHL5yX+gmDh9jR4Z0BpAgKZ/TJL/xuTrsU4554VnBtxlp
   XRx2E5xF2mPUdfPgBP4FIgKvDgbrZdP1VxpYwFaBKp6aXfd7ncC2xBaZd
   CHeswaA8ttUP/oOY8oL0ScqheSg6II/JKPNpLklbeTLZP9Sd6A6P7agNF
   PgpxX5dlw3SHQZLjMaEuZmK2efpAJwqPV9ph8cblF7GAazopR5winhbH2
   9xQhpzv+TLW9/DVnBMEQBc2oG46oGb/Wk+EEkpk+O8Q/IgEuhp7DsVJa/
   r7CQqsLYFiB5ReJ5iRxfTfQcISa/aKUBdEFWiUuWKqhNo1n4LOTBGGDsY
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10622"; a="311848306"
X-IronPort-AV: E=Sophos;i="5.97,300,1669104000"; 
   d="scan'208";a="311848306"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Feb 2023 09:03:56 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10622"; a="812539983"
X-IronPort-AV: E=Sophos;i="5.97,300,1669104000"; 
   d="scan'208";a="812539983"
Received: from lkp-server01.sh.intel.com (HELO 4455601a8d94) ([10.239.97.150])
  by fmsmga001.fm.intel.com with ESMTP; 15 Feb 2023 09:03:55 -0800
Received: from kbuild by 4455601a8d94 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pSLCE-0009Zl-2X;
	Wed, 15 Feb 2023 17:03:54 +0000
Date: Thu, 16 Feb 2023 01:03:43 +0800
From: kernel test robot <lkp@intel.com>
To: Ilya Leoshkevich <iii@linux.ibm.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH bpf-next 22/24] s390/bpf: Implement
 arch_prepare_bpf_trampoline()
Message-ID: <202302160158.P4gvGOoV-lkp@intel.com>
References: <20230125213817.1424447-23-iii@linux.ibm.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230125213817.1424447-23-iii@linux.ibm.com>

Hi Ilya,

I love your patch! Perhaps something to improve:

[auto build test WARNING on bpf-next/master]

url:    https://github.com/intel-lab-lkp/linux/commits/Ilya-Leoshkevich/selftests-bpf-Fix-liburandom_read-so-linker-error/20230128-150321
base:   https://git.kernel.org/pub/scm/linux/kernel/git/bpf/bpf-next.git master
patch link:    https://lore.kernel.org/r/20230125213817.1424447-23-iii%40linux.ibm.com
patch subject: [PATCH bpf-next 22/24] s390/bpf: Implement arch_prepare_bpf_trampoline()
config: s390-randconfig-r025-20230212 (https://download.01.org/0day-ci/archive/20230216/202302160158.P4gvGOoV-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project db89896bbbd2251fff457699635acbbedeead27f)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install s390 cross compiling tool for clang build
        # apt-get install binutils-s390x-linux-gnu
        # https://github.com/intel-lab-lkp/linux/commit/6257ca590791a94b97f1b4f72851dc110290a52b
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Ilya-Leoshkevich/selftests-bpf-Fix-liburandom_read-so-linker-error/20230128-150321
        git checkout 6257ca590791a94b97f1b4f72851dc110290a52b
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=s390 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=s390 SHELL=/bin/bash arch/s390/net/ drivers/md/bcache/ drivers/pci/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202302160158.P4gvGOoV-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from arch/s390/net/bpf_jit_comp.c:21:
   In file included from include/linux/netdevice.h:38:
   In file included from include/net/net_namespace.h:43:
   In file included from include/linux/skbuff.h:31:
   In file included from include/linux/dma-mapping.h:10:
   In file included from include/linux/scatterlist.h:9:
   In file included from arch/s390/include/asm/io.h:75:
   include/asm-generic/io.h:547:31: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           val = __raw_readb(PCI_IOBASE + addr);
                             ~~~~~~~~~~ ^
   include/asm-generic/io.h:560:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           val = __le16_to_cpu((__le16 __force)__raw_readw(PCI_IOBASE + addr));
                                                           ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/big_endian.h:37:59: note: expanded from macro '__le16_to_cpu'
   #define __le16_to_cpu(x) __swab16((__force __u16)(__le16)(x))
                                                             ^
   include/uapi/linux/swab.h:102:54: note: expanded from macro '__swab16'
   #define __swab16(x) (__u16)__builtin_bswap16((__u16)(x))
                                                        ^
   In file included from arch/s390/net/bpf_jit_comp.c:21:
   In file included from include/linux/netdevice.h:38:
   In file included from include/net/net_namespace.h:43:
   In file included from include/linux/skbuff.h:31:
   In file included from include/linux/dma-mapping.h:10:
   In file included from include/linux/scatterlist.h:9:
   In file included from arch/s390/include/asm/io.h:75:
   include/asm-generic/io.h:573:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           val = __le32_to_cpu((__le32 __force)__raw_readl(PCI_IOBASE + addr));
                                                           ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/big_endian.h:35:59: note: expanded from macro '__le32_to_cpu'
   #define __le32_to_cpu(x) __swab32((__force __u32)(__le32)(x))
                                                             ^
   include/uapi/linux/swab.h:115:54: note: expanded from macro '__swab32'
   #define __swab32(x) (__u32)__builtin_bswap32((__u32)(x))
                                                        ^
   In file included from arch/s390/net/bpf_jit_comp.c:21:
   In file included from include/linux/netdevice.h:38:
   In file included from include/net/net_namespace.h:43:
   In file included from include/linux/skbuff.h:31:
   In file included from include/linux/dma-mapping.h:10:
   In file included from include/linux/scatterlist.h:9:
   In file included from arch/s390/include/asm/io.h:75:
   include/asm-generic/io.h:584:33: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           __raw_writeb(value, PCI_IOBASE + addr);
                               ~~~~~~~~~~ ^
   include/asm-generic/io.h:594:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           __raw_writew((u16 __force)cpu_to_le16(value), PCI_IOBASE + addr);
                                                         ~~~~~~~~~~ ^
   include/asm-generic/io.h:604:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           __raw_writel((u32 __force)cpu_to_le32(value), PCI_IOBASE + addr);
                                                         ~~~~~~~~~~ ^
   include/asm-generic/io.h:692:20: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           readsb(PCI_IOBASE + addr, buffer, count);
                  ~~~~~~~~~~ ^
   include/asm-generic/io.h:700:20: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           readsw(PCI_IOBASE + addr, buffer, count);
                  ~~~~~~~~~~ ^
   include/asm-generic/io.h:708:20: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           readsl(PCI_IOBASE + addr, buffer, count);
                  ~~~~~~~~~~ ^
   include/asm-generic/io.h:717:21: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           writesb(PCI_IOBASE + addr, buffer, count);
                   ~~~~~~~~~~ ^
   include/asm-generic/io.h:726:21: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           writesw(PCI_IOBASE + addr, buffer, count);
                   ~~~~~~~~~~ ^
   include/asm-generic/io.h:735:21: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           writesl(PCI_IOBASE + addr, buffer, count);
                   ~~~~~~~~~~ ^
>> arch/s390/net/bpf_jit_comp.c:2155:5: warning: no previous prototype for function '__arch_prepare_bpf_trampoline' [-Wmissing-prototypes]
   int __arch_prepare_bpf_trampoline(struct bpf_tramp_image *im,
       ^
   arch/s390/net/bpf_jit_comp.c:2155:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   int __arch_prepare_bpf_trampoline(struct bpf_tramp_image *im,
   ^
   static 
   13 warnings generated.


vim +/__arch_prepare_bpf_trampoline +2155 arch/s390/net/bpf_jit_comp.c

  2154	
> 2155	int __arch_prepare_bpf_trampoline(struct bpf_tramp_image *im,
  2156					  struct bpf_tramp_jit *tjit,
  2157					  const struct btf_func_model *m,
  2158					  u32 flags, struct bpf_tramp_links *tlinks,
  2159					  void *func_addr)
  2160	{
  2161		struct bpf_tramp_links *fmod_ret = &tlinks[BPF_TRAMP_MODIFY_RETURN];
  2162		struct bpf_tramp_links *fentry = &tlinks[BPF_TRAMP_FENTRY];
  2163		struct bpf_tramp_links *fexit = &tlinks[BPF_TRAMP_FEXIT];
  2164		int nr_bpf_args, nr_reg_args, nr_stack_args;
  2165		struct bpf_jit *jit = &tjit->common;
  2166		int arg, bpf_arg_off;
  2167		int i, j;
  2168	
  2169		/* Support as many stack arguments as "mvc" instruction can handle. */
  2170		nr_reg_args = min_t(int, m->nr_args, MAX_NR_REG_ARGS);
  2171		nr_stack_args = m->nr_args - nr_reg_args;
  2172		if (nr_stack_args > MAX_NR_STACK_ARGS)
  2173			return -ENOTSUPP;
  2174	
  2175		/* Return to %r14, since func_addr and %r0 are not available. */
  2176		if (!func_addr && !(flags & BPF_TRAMP_F_ORIG_STACK))
  2177			flags |= BPF_TRAMP_F_SKIP_FRAME;
  2178	
  2179		/*
  2180		 * Compute how many arguments we need to pass to BPF programs.
  2181		 * BPF ABI mirrors that of x86_64: arguments that are 16 bytes or
  2182		 * smaller are packed into 1 or 2 registers; larger arguments are
  2183		 * passed via pointers.
  2184		 * In s390x ABI, arguments that are 8 bytes or smaller are packed into
  2185		 * a register; larger arguments are passed via pointers.
  2186		 * We need to deal with this difference.
  2187		 */
  2188		nr_bpf_args = 0;
  2189		for (i = 0; i < m->nr_args; i++) {
  2190			if (m->arg_size[i] <= 8)
  2191				nr_bpf_args += 1;
  2192			else if (m->arg_size[i] <= 16)
  2193				nr_bpf_args += 2;
  2194			else
  2195				return -ENOTSUPP;
  2196		}
  2197	
  2198		/*
  2199		 * Calculate the stack layout.
  2200		 */
  2201	
  2202		/* Reserve STACK_FRAME_OVERHEAD bytes for the callees. */
  2203		tjit->stack_size = STACK_FRAME_OVERHEAD;
  2204		tjit->stack_args_off = alloc_stack(tjit, nr_stack_args * sizeof(u64));
  2205		tjit->reg_args_off = alloc_stack(tjit, nr_reg_args * sizeof(u64));
  2206		tjit->ip_off = alloc_stack(tjit, sizeof(u64));
  2207		tjit->arg_cnt_off = alloc_stack(tjit, sizeof(u64));
  2208		tjit->bpf_args_off = alloc_stack(tjit, nr_bpf_args * sizeof(u64));
  2209		tjit->retval_off = alloc_stack(tjit, sizeof(u64));
  2210		tjit->r7_r8_off = alloc_stack(tjit, 2 * sizeof(u64));
  2211		tjit->r14_off = alloc_stack(tjit, sizeof(u64));
  2212		tjit->run_ctx_off = alloc_stack(tjit,
  2213						sizeof(struct bpf_tramp_run_ctx));
  2214		/* The caller has already reserved STACK_FRAME_OVERHEAD bytes. */
  2215		tjit->stack_size -= STACK_FRAME_OVERHEAD;
  2216		tjit->orig_stack_args_off = tjit->stack_size + STACK_FRAME_OVERHEAD;
  2217	
  2218		/* aghi %r15,-stack_size */
  2219		EMIT4_IMM(0xa70b0000, REG_15, -tjit->stack_size);
  2220		/* stmg %r2,%rN,fwd_reg_args_off(%r15) */
  2221		if (nr_reg_args)
  2222			EMIT6_DISP_LH(0xeb000000, 0x0024, REG_2,
  2223				      REG_2 + (nr_reg_args - 1), REG_15,
  2224				      tjit->reg_args_off);
  2225		for (i = 0, j = 0; i < m->nr_args; i++) {
  2226			if (i < MAX_NR_REG_ARGS)
  2227				arg = REG_2 + i;
  2228			else
  2229				arg = tjit->orig_stack_args_off +
  2230				      (i - MAX_NR_REG_ARGS) * sizeof(u64);
  2231			bpf_arg_off = tjit->bpf_args_off + j * sizeof(u64);
  2232			if (m->arg_size[i] <= 8) {
  2233				if (i < MAX_NR_REG_ARGS)
  2234					/* stg %arg,bpf_arg_off(%r15) */
  2235					EMIT6_DISP_LH(0xe3000000, 0x0024, arg,
  2236						      REG_0, REG_15, bpf_arg_off);
  2237				else
  2238					/* mvc bpf_arg_off(8,%r15),arg(%r15) */
  2239					_EMIT6(0xd207f000 | bpf_arg_off,
  2240					       0xf000 | arg);
  2241				j += 1;
  2242			} else {
  2243				if (i < MAX_NR_REG_ARGS) {
  2244					/* mvc bpf_arg_off(16,%r15),0(%arg) */
  2245					_EMIT6(0xd20ff000 | bpf_arg_off,
  2246					       reg2hex[arg] << 12);
  2247				} else {
  2248					/* lg %r1,arg(%r15) */
  2249					EMIT6_DISP_LH(0xe3000000, 0x0004, REG_1, REG_0,
  2250						      REG_15, arg);
  2251					/* mvc bpf_arg_off(16,%r15),0(%r1) */
  2252					_EMIT6(0xd20ff000 | bpf_arg_off, 0x1000);
  2253				}
  2254				j += 2;
  2255			}
  2256		}
  2257		/* stmg %r7,%r8,r7_r8_off(%r15) */
  2258		EMIT6_DISP_LH(0xeb000000, 0x0024, REG_7, REG_8, REG_15,
  2259			      tjit->r7_r8_off);
  2260		/* stg %r14,r14_off(%r15) */
  2261		EMIT6_DISP_LH(0xe3000000, 0x0024, REG_14, REG_0, REG_15, tjit->r14_off);
  2262	
  2263		if (flags & BPF_TRAMP_F_ORIG_STACK) {
  2264			/*
  2265			 * The ftrace trampoline puts the return address (which is the
  2266			 * address of the original function + S390X_PATCH_SIZE) into
  2267			 * %r0; see ftrace_shared_hotpatch_trampoline_br and
  2268			 * ftrace_init_nop() for details.
  2269			 */
  2270	
  2271			/* lgr %r8,%r0 */
  2272			EMIT4(0xb9040000, REG_8, REG_0);
  2273		} else {
  2274			/* %r8 = func_addr + S390X_PATCH_SIZE */
  2275			load_imm64(jit, REG_8, (u64)func_addr + S390X_PATCH_SIZE);
  2276		}
  2277	
  2278		/*
  2279		 * ip = func_addr;
  2280		 * arg_cnt = m->nr_args;
  2281		 */
  2282	
  2283		if (flags & BPF_TRAMP_F_IP_ARG) {
  2284			/* %r0 = func_addr */
  2285			load_imm64(jit, REG_0, (u64)func_addr);
  2286			/* stg %r0,ip_off(%r15) */
  2287			EMIT6_DISP_LH(0xe3000000, 0x0024, REG_0, REG_0, REG_15,
  2288				      tjit->ip_off);
  2289		}
  2290		/* lghi %r0,nr_bpf_args */
  2291		EMIT4_IMM(0xa7090000, REG_0, nr_bpf_args);
  2292		/* stg %r0,arg_cnt_off(%r15) */
  2293		EMIT6_DISP_LH(0xe3000000, 0x0024, REG_0, REG_0, REG_15,
  2294			      tjit->arg_cnt_off);
  2295	
  2296		if (flags & BPF_TRAMP_F_CALL_ORIG) {
  2297			/*
  2298			 * __bpf_tramp_enter(im);
  2299			 */
  2300	
  2301			/* %r1 = __bpf_tramp_enter */
  2302			load_imm64(jit, REG_1, (u64)__bpf_tramp_enter);
  2303			/* %r2 = im */
  2304			load_imm64(jit, REG_2, (u64)im);
  2305			/* %r1() */
  2306			call_r1(jit);
  2307		}
  2308	
  2309		for (i = 0; i < fentry->nr_links; i++)
  2310			invoke_bpf_prog(tjit, m, fentry->links[i],
  2311					flags & BPF_TRAMP_F_RET_FENTRY_RET);
  2312	
  2313		if (fmod_ret->nr_links) {
  2314			/*
  2315			 * retval = 0;
  2316			 */
  2317	
  2318			/* xc retval_off(8,%r15),retval_off(%r15) */
  2319			_EMIT6(0xd707f000 | tjit->retval_off,
  2320			       0xf000 | tjit->retval_off);
  2321	
  2322			for (i = 0; i < fmod_ret->nr_links; i++) {
  2323				invoke_bpf_prog(tjit, m, fmod_ret->links[i], true);
  2324	
  2325				/*
  2326				 * if (retval)
  2327				 *         goto do_fexit;
  2328				 */
  2329	
  2330				/* ltg %r0,retval_off(%r15) */
  2331				EMIT6_DISP_LH(0xe3000000, 0x0002, REG_0, REG_0, REG_15,
  2332					      tjit->retval_off);
  2333				/* brcl 7,do_fexit */
  2334				EMIT6_PCREL_RILC(0xc0040000, 7, tjit->do_fexit);
  2335			}
  2336		}
  2337	
  2338		if (flags & BPF_TRAMP_F_CALL_ORIG) {
  2339			/*
  2340			 * retval = func_addr(args);
  2341			 */
  2342	
  2343			/* lmg %r2,%rN,reg_args_off(%r15) */
  2344			if (nr_reg_args)
  2345				EMIT6_DISP_LH(0xeb000000, 0x0004, REG_2,
  2346					      REG_2 + (nr_reg_args - 1), REG_15,
  2347					      tjit->reg_args_off);
  2348			/* mvc stack_args_off(N,%r15),orig_stack_args_off(%r15) */
  2349			if (nr_stack_args)
  2350				_EMIT6(0xd200f000 |
  2351					       (nr_stack_args * sizeof(u64) - 1) << 16 |
  2352					       tjit->stack_args_off,
  2353				       0xf000 | tjit->orig_stack_args_off);
  2354			/* lgr %r1,%r8 */
  2355			EMIT4(0xb9040000, REG_1, REG_8);
  2356			/* %r1() */
  2357			call_r1(jit);
  2358			/* stg %r2,retval_off(%r15) */
  2359			EMIT6_DISP_LH(0xe3000000, 0x0024, REG_2, REG_0, REG_15,
  2360				      tjit->retval_off);
  2361	
  2362			im->ip_after_call = jit->prg_buf + jit->prg;
  2363	
  2364			/*
  2365			 * The following nop will be patched by bpf_tramp_image_put().
  2366			 */
  2367	
  2368			/* brcl 0,im->ip_epilogue */
  2369			EMIT6_PCREL_RILC(0xc0040000, 0, (u64)im->ip_epilogue);
  2370		}
  2371	
  2372		/* do_fexit: */
  2373		tjit->do_fexit = jit->prg;
  2374		for (i = 0; i < fexit->nr_links; i++)
  2375			invoke_bpf_prog(tjit, m, fexit->links[i], false);
  2376	
  2377		if (flags & BPF_TRAMP_F_CALL_ORIG) {
  2378			im->ip_epilogue = jit->prg_buf + jit->prg;
  2379	
  2380			/*
  2381			 * __bpf_tramp_exit(im);
  2382			 */
  2383	
  2384			/* %r1 = __bpf_tramp_exit */
  2385			load_imm64(jit, REG_1, (u64)__bpf_tramp_exit);
  2386			/* %r2 = im */
  2387			load_imm64(jit, REG_2, (u64)im);
  2388			/* %r1() */
  2389			call_r1(jit);
  2390		}
  2391	
  2392		/* lmg %r2,%rN,reg_args_off(%r15) */
  2393		if ((flags & BPF_TRAMP_F_RESTORE_REGS) && nr_reg_args)
  2394			EMIT6_DISP_LH(0xeb000000, 0x0004, REG_2,
  2395				      REG_2 + (nr_reg_args - 1), REG_15,
  2396				      tjit->reg_args_off);
  2397		/* lgr %r1,%r8 */
  2398		if (!(flags & BPF_TRAMP_F_SKIP_FRAME))
  2399			EMIT4(0xb9040000, REG_1, REG_8);
  2400		/* lmg %r7,%r8,r7_r8_off(%r15) */
  2401		EMIT6_DISP_LH(0xeb000000, 0x0004, REG_7, REG_8, REG_15,
  2402			      tjit->r7_r8_off);
  2403		/* lg %r14,r14_off(%r15) */
  2404		EMIT6_DISP_LH(0xe3000000, 0x0004, REG_14, REG_0, REG_15, tjit->r14_off);
  2405		/* lg %r2,retval_off(%r15) */
  2406		if (flags & (BPF_TRAMP_F_CALL_ORIG | BPF_TRAMP_F_RET_FENTRY_RET))
  2407			EMIT6_DISP_LH(0xe3000000, 0x0004, REG_2, REG_0, REG_15,
  2408				      tjit->retval_off);
  2409		/* aghi %r15,stack_size */
  2410		EMIT4_IMM(0xa70b0000, REG_15, tjit->stack_size);
  2411		/* Emit an expoline for the following indirect jump. */
  2412		if (nospec_uses_trampoline())
  2413			emit_expoline(jit);
  2414		if (flags & BPF_TRAMP_F_SKIP_FRAME)
  2415			/* br %r14 */
  2416			_EMIT2(0x07fe);
  2417		else
  2418			/* br %r1 */
  2419			_EMIT2(0x07f1);
  2420	
  2421		emit_r1_thunk(jit);
  2422	
  2423		return 0;
  2424	}
  2425	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
