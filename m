Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90C1EBA34;
	Sat, 31 Jan 2026 03:55:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769831748; cv=none; b=JH57QwvdWl/WWW4GgvwqdiDuRvoSM3c9FyLrUcfxYOhDrI2MsjGHd4kh75t7b22AE98+lJYuIRDAb2NGPOKzGpmB2bz6VDf/cZhCpeq7NAsBetEa9JI2l8r8kGrNAU83agQu4aa+Vbs1Jn1vlhOD4sGroSQC7iLlGyC/OZja6GQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769831748; c=relaxed/simple;
	bh=ehNkCNTyo0Wk1sECuUyxMmMYq8IyJEXWKANpmedgp8A=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=S1w96FrMbzEIq17Ghl+pdhOw7ry/o33q7tjWsX8xkm1VOp2YO2Iyyd3RJnH0KY4KjIOxoRcsvvEDRE+7qRVcGYnZYjBTiRdmJxqSiMzlCClvL5PFUrVqB4agh/YQl7CHeicUsKBJBUyy0EAYDejWhFQKBaV/v8SaPE+BbXd4EHc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Lb8T4giw; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Lb8T4giw"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769831746; x=1801367746;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=ehNkCNTyo0Wk1sECuUyxMmMYq8IyJEXWKANpmedgp8A=;
  b=Lb8T4giwKGU5510HJCEbQh8+bPgHqQZjqjNC+2bwPw3U9FBjC9aaXBuX
   RW342hnjp1FpuAAnY7vuqdW3AlgWZOOQqBzDB1lsEiipr0lDx/a0GHsDQ
   +6uvQTFcdebHyIHbGxOKWihsnmOMkk4ldLw2P2valP0/85cuSyqt5pOwa
   fr1O0qrO78wXCeyMOgDiEcOMy8WTxZzlBpkt7Olg/qtQsqIRQt6dsh+vo
   RhL4D7ZzU7t5z8vB9mEU/MrP0A04A30N6+DTzxLn2xm572ZQmKWMmgSjj
   9VwmgTxb5RoEsCZAnIXEzNiWd/EwdUEUl58MGRzJRS2+OLl+P0QjhYOQa
   w==;
X-CSE-ConnectionGUID: FL3ywf00Snawe3MlSPkA1A==
X-CSE-MsgGUID: MWbbOCQRT0+9a+3OzYvmLw==
X-IronPort-AV: E=McAfee;i="6800,10657,11687"; a="96540622"
X-IronPort-AV: E=Sophos;i="6.21,264,1763452800"; 
   d="scan'208";a="96540622"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jan 2026 19:55:46 -0800
X-CSE-ConnectionGUID: 2qluSripTluCL59yGZ9CoQ==
X-CSE-MsgGUID: 6vM5eegiSASiuk/9IjmAMQ==
X-ExtLoop1: 1
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 30 Jan 2026 19:55:44 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vm25G-00000000dd2-11uZ;
	Sat, 31 Jan 2026 03:55:42 +0000
Date: Sat, 31 Jan 2026 11:55:16 +0800
From: kernel test robot <lkp@intel.com>
To: Jiri Olsa <jolsa@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [jolsa-perf:bpf/tracing_multi_9 3/12]
 include/linux/bpf.h:1544:51: warning: declaration of 'struct bpf_tramp_link'
 will not be visible outside of this function
Message-ID: <202601311158.gDGF6YXB-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jolsa/perf.git bpf/=
tracing_multi_9
head:   4a1d38e3df06743886a06b547187aec8023ef27d
commit: 79e86aac9eaf3b5bdb4db339fb6082022ef69eb9 [3/12] bpf: Add struct bpf=
_tramp_node object
config: arm-allnoconfig (https://download.01.org/0day-ci/archive/20260131/2=
02601311158.gDGF6YXB-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 9b8=
addffa70cee5b2acc5454712d9cf78ce45710)
reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archive=
/20260131/202601311158.gDGF6YXB-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new versio=
n of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601311158.gDGF6YXB-lkp@i=
ntel.com/

All warnings (new ones prefixed by >>):

   In file included from kernel/sched/rq-offsets.c:5:
   In file included from kernel/sched/sched.h:61:
   In file included from include/linux/syscalls_api.h:1:
   In file included from include/linux/syscalls.h:96:
   In file included from include/trace/syscall.h:7:
   In file included from include/linux/trace_events.h:10:
   In file included from include/linux/perf_event.h:53:
   In file included from include/linux/security.h:35:
>> include/linux/bpf.h:1544:51: warning: declaration of 'struct bpf_tramp_l=
ink' will not be visible outside of this function [-Wvisibility]
    1544 | static inline int bpf_trampoline_link_prog(struct bpf_tramp_link=
 *link,
         |                                                   ^
   include/linux/bpf.h:1550:53: warning: declaration of 'struct bpf_tramp_l=
ink' will not be visible outside of this function [-Wvisibility]
    1550 | static inline int bpf_trampoline_unlink_prog(struct bpf_tramp_li=
nk *link,
         |                                                     ^
   2 warnings generated.
--
   In file included from kernel/sched/rq-offsets.c:5:
   In file included from kernel/sched/sched.h:61:
   In file included from include/linux/syscalls_api.h:1:
   In file included from include/linux/syscalls.h:96:
   In file included from include/trace/syscall.h:7:
   In file included from include/linux/trace_events.h:10:
   In file included from include/linux/perf_event.h:53:
   In file included from include/linux/security.h:35:
>> include/linux/bpf.h:1544:51: warning: declaration of 'struct bpf_tramp_l=
ink' will not be visible outside of this function [-Wvisibility]
    1544 | static inline int bpf_trampoline_link_prog(struct bpf_tramp_link=
 *link,
         |                                                   ^
   include/linux/bpf.h:1550:53: warning: declaration of 'struct bpf_tramp_l=
ink' will not be visible outside of this function [-Wvisibility]
    1550 | static inline int bpf_trampoline_unlink_prog(struct bpf_tramp_li=
nk *link,
         |                                                     ^
   2 warnings generated.


vim +1544 include/linux/bpf.h

75ccbef6369e94e Bj=C3=B6rn T=C3=B6pel            2019-12-13  1508 =20
75ccbef6369e94e Bj=C3=B6rn T=C3=B6pel            2019-12-13  1509  #define =
DEFINE_BPF_DISPATCHER(name)					\
c86df29d11dfba2 Peter Zijlstra         2022-11-03  1510  	__BPF_DISPATCHER_=
SC(name);					\
4f9087f16651aca Peter Zijlstra         2023-12-15  1511  	noinline __bpfcal=
l unsigned int bpf_dispatcher_##name##_func(	\
75ccbef6369e94e Bj=C3=B6rn T=C3=B6pel            2019-12-13  1512  		const =
void *ctx,					\
75ccbef6369e94e Bj=C3=B6rn T=C3=B6pel            2019-12-13  1513  		const =
struct bpf_insn *insnsi,				\
af3f4134006bf3b Stanislav Fomichev     2022-06-28  1514  		bpf_func_t bpf_f=
unc)					\
75ccbef6369e94e Bj=C3=B6rn T=C3=B6pel            2019-12-13  1515  	{						=
		\
c86df29d11dfba2 Peter Zijlstra         2022-11-03  1516  		return __BPF_DIS=
PATCHER_CALL(name);			\
75ccbef6369e94e Bj=C3=B6rn T=C3=B6pel            2019-12-13  1517  	}						=
		\
6a64037d4bf252b Bj=C3=B6rn T=C3=B6pel            2020-03-12  1518  	EXPORT_=
SYMBOL(bpf_dispatcher_##name##_func);			\
6a64037d4bf252b Bj=C3=B6rn T=C3=B6pel            2020-03-12  1519  	struct =
bpf_dispatcher bpf_dispatcher_##name =3D			\
18acb7fac22ff7b Peter Zijlstra         2022-11-03  1520  		BPF_DISPATCHER_I=
NIT(bpf_dispatcher_##name);
dbe69b29988465b Jiri Olsa              2022-10-18  1521 =20
75ccbef6369e94e Bj=C3=B6rn T=C3=B6pel            2019-12-13  1522  #define =
DECLARE_BPF_DISPATCHER(name)					\
6a64037d4bf252b Bj=C3=B6rn T=C3=B6pel            2020-03-12  1523  	unsigne=
d int bpf_dispatcher_##name##_func(			\
75ccbef6369e94e Bj=C3=B6rn T=C3=B6pel            2019-12-13  1524  		const =
void *ctx,					\
75ccbef6369e94e Bj=C3=B6rn T=C3=B6pel            2019-12-13  1525  		const =
struct bpf_insn *insnsi,				\
af3f4134006bf3b Stanislav Fomichev     2022-06-28  1526  		bpf_func_t bpf_f=
unc);					\
6a64037d4bf252b Bj=C3=B6rn T=C3=B6pel            2020-03-12  1527  	extern =
struct bpf_dispatcher bpf_dispatcher_##name;
c86df29d11dfba2 Peter Zijlstra         2022-11-03  1528 =20
6a64037d4bf252b Bj=C3=B6rn T=C3=B6pel            2020-03-12  1529  #define =
BPF_DISPATCHER_FUNC(name) bpf_dispatcher_##name##_func
6a64037d4bf252b Bj=C3=B6rn T=C3=B6pel            2020-03-12  1530  #define =
BPF_DISPATCHER_PTR(name) (&bpf_dispatcher_##name)
75ccbef6369e94e Bj=C3=B6rn T=C3=B6pel            2019-12-13  1531  void bpf=
_dispatcher_change_prog(struct bpf_dispatcher *d, struct bpf_prog *from,
75ccbef6369e94e Bj=C3=B6rn T=C3=B6pel            2019-12-13  1532  				stru=
ct bpf_prog *to);
dba122fb5e122e8 Jiri Olsa              2020-03-12  1533  /* Called only fro=
m JIT-enabled code, so there's no need for stubs. */
7c8ce4ffb684676 Xu Kuohai              2024-11-12  1534  void bpf_image_ksy=
m_init(void *data, unsigned int size, struct bpf_ksym *ksym);
7c8ce4ffb684676 Xu Kuohai              2024-11-12  1535  void bpf_image_ksy=
m_add(struct bpf_ksym *ksym);
a108f7dcfa010e3 Jiri Olsa              2020-03-12  1536  void bpf_image_ksy=
m_del(struct bpf_ksym *ksym);
dba122fb5e122e8 Jiri Olsa              2020-03-12  1537  void bpf_ksym_add(=
struct bpf_ksym *ksym);
dba122fb5e122e8 Jiri Olsa              2020-03-12  1538  void bpf_ksym_del(=
struct bpf_ksym *ksym);
ca45c84afb8c91a Josh Poimboeuf         2025-12-03  1539  bool bpf_has_frame=
_pointer(unsigned long ip);
3486bedd99196ec Song Liu               2022-02-04  1540  int bpf_jit_charge=
_modmem(u32 size);
3486bedd99196ec Song Liu               2022-02-04  1541  void bpf_jit_uncha=
rge_modmem(u32 size);
f92c1e183604c20 Jiri Olsa              2021-12-08  1542  bool bpf_prog_has_=
trampoline(const struct bpf_prog *prog);
fec56f5890d93fc Alexei Starovoitov     2019-11-14  1543  #else
f7e0beaf39d3868 Kui-Feng Lee           2022-05-10 @1544  static inline int =
bpf_trampoline_link_prog(struct bpf_tramp_link *link,
d6083f040d5d8f8 Leon Hwang             2024-10-15  1545  					   struct bpf=
_trampoline *tr,
d6083f040d5d8f8 Leon Hwang             2024-10-15  1546  					   struct bpf=
_prog *tgt_prog)
fec56f5890d93fc Alexei Starovoitov     2019-11-14  1547  {
fec56f5890d93fc Alexei Starovoitov     2019-11-14  1548  	return -ENOTSUPP;
fec56f5890d93fc Alexei Starovoitov     2019-11-14  1549  }
f7e0beaf39d3868 Kui-Feng Lee           2022-05-10  1550  static inline int =
bpf_trampoline_unlink_prog(struct bpf_tramp_link *link,
d6083f040d5d8f8 Leon Hwang             2024-10-15  1551  					     struct b=
pf_trampoline *tr,
d6083f040d5d8f8 Leon Hwang             2024-10-15  1552  					     struct b=
pf_prog *tgt_prog)
fec56f5890d93fc Alexei Starovoitov     2019-11-14  1553  {
fec56f5890d93fc Alexei Starovoitov     2019-11-14  1554  	return -ENOTSUPP;
fec56f5890d93fc Alexei Starovoitov     2019-11-14  1555  }
f7b12b6fea00988 Toke H=C3=B8iland-J=C3=B8rgensen 2020-09-25  1556  static i=
nline struct bpf_trampoline *bpf_trampoline_get(u64 key,
f7b12b6fea00988 Toke H=C3=B8iland-J=C3=B8rgensen 2020-09-25  1557  							s=
truct bpf_attach_target_info *tgt_info)
f7b12b6fea00988 Toke H=C3=B8iland-J=C3=B8rgensen 2020-09-25  1558  {
b724a6418f1f853 Leon Hwang             2023-09-17  1559  	return NULL;
f7b12b6fea00988 Toke H=C3=B8iland-J=C3=B8rgensen 2020-09-25  1560  }
fec56f5890d93fc Alexei Starovoitov     2019-11-14  1561  static inline void=
 bpf_trampoline_put(struct bpf_trampoline *tr) {}
75ccbef6369e94e Bj=C3=B6rn T=C3=B6pel            2019-12-13  1562  #define =
DEFINE_BPF_DISPATCHER(name)
75ccbef6369e94e Bj=C3=B6rn T=C3=B6pel            2019-12-13  1563  #define =
DECLARE_BPF_DISPATCHER(name)
6a64037d4bf252b Bj=C3=B6rn T=C3=B6pel            2020-03-12  1564  #define =
BPF_DISPATCHER_FUNC(name) bpf_dispatcher_nop_func
75ccbef6369e94e Bj=C3=B6rn T=C3=B6pel            2019-12-13  1565  #define =
BPF_DISPATCHER_PTR(name) NULL
75ccbef6369e94e Bj=C3=B6rn T=C3=B6pel            2019-12-13  1566  static i=
nline void bpf_dispatcher_change_prog(struct bpf_dispatcher *d,
75ccbef6369e94e Bj=C3=B6rn T=C3=B6pel            2019-12-13  1567  					   =
   struct bpf_prog *from,
75ccbef6369e94e Bj=C3=B6rn T=C3=B6pel            2019-12-13  1568  					   =
   struct bpf_prog *to) {}
e9b4e606c2289d6 Jiri Olsa              2020-01-23  1569  static inline bool=
 is_bpf_image_address(unsigned long address)
e9b4e606c2289d6 Jiri Olsa              2020-01-23  1570  {
e9b4e606c2289d6 Jiri Olsa              2020-01-23  1571  	return false;
e9b4e606c2289d6 Jiri Olsa              2020-01-23  1572  }
f92c1e183604c20 Jiri Olsa              2021-12-08  1573  static inline bool=
 bpf_prog_has_trampoline(const struct bpf_prog *prog)
f92c1e183604c20 Jiri Olsa              2021-12-08  1574  {
f92c1e183604c20 Jiri Olsa              2021-12-08  1575  	return false;
f92c1e183604c20 Jiri Olsa              2021-12-08  1576  }
fec56f5890d93fc Alexei Starovoitov     2019-11-14  1577  #endif
fec56f5890d93fc Alexei Starovoitov     2019-11-14  1578 =20

:::::: The code at line 1544 was first introduced by commit
:::::: f7e0beaf39d3868dc700d4954b26cf8443c5d423 bpf, x86: Generate trampoli=
nes from bpf_tramp_links

:::::: TO: Kui-Feng Lee <kuifeng@fb.com>
:::::: CC: Andrii Nakryiko <andrii@kernel.org>

--=20
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
