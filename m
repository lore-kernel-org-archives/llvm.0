Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.7
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794059630;
	b=ppV7IVoZnf1prjTSEo89arDRC1eqZN0EjXDntNdq2TNQMgArGUy3wOw4ppR5xFgzMT3W
	 UOZTgXMfbDGOSJwQrw8DDiDKH+/au6atsTvu2PQty0YsoCY5yHRNZm98Rpj33zz4tLlPn
	 XfIl5j8ZWFVCKcHzP8thIC/6GqMI5Nz92T9C/TU7jSHWiKEiTtoEpfFpdZH+iqXXuCsAl
	 nNLzmvVtP14SUfoHlAz7mc2Hffl/vmMQ11edTMOsj+pKbvuLe1dUhfdFvU3zpfLKaNRwP
	 AIzKNGL8VUAhYi3i+Neo5WKSaa02LnOeHVDZZ0+paaksZpcWCWCaOWAFop0VB6JsriA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794059630;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=hAS41AZOJdwOklXLFprdBJrkW1kTmsku+CqGAcTK/kA=;
	b=yozcKunVCUznfBKZkCrV3VblQn789JqwRbnrCgtoTKGJ3cmXdnsn+bYzX5WixS7ssgwT
	 vUfBktJqwIzysCCxtwmEm4LBE5ndibwGe9oTjnnukqPFyQkoN2XjSa4z0wGQHlX7/AYKG
	 +Ayz3Es0Z2krAHHzSvgdpeyssjtIz15jC8Lul7K0lkBaWxnJaJEuQ/GsdU6W/pnRLY2sb
	 QX8X7fS9B1UM62yaE/fmIeSvPX9ZovRZI/f13+18Xf/FUGJ0QTb5U4/GMeskmyza8pgsy
	 Hj8NhtqTfqiovFZxYJ9nq+E77xXwWu648HNnRRPlZ4DFGeTKlkjlWBFJVs7J1LlX+kA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b="AGr0eCI/";
	arc=none smtp.remote-ip=192.198.163.7
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9C29606A32C;
	Sat,  7 Nov 2026 13:53:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B9C29606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=AGr0eCI/
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794059628; x=1825595628;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=j4eQwaq+lYpHIpKnZ6lc6+3ALRxkcnvcynnLzQjsgoo=;
  b=AGr0eCI/7rwHmF9IKCdc/dyNEj6MF21BpMTic1TH3Qgm2t5cxKYNwDd+
   DUYiyB6pNGqljP/yHlvqdbIUlve5uIASEYVywaxwWg0Yffq3FJ6e314lX
   34QauhAhIhafQF43E4GSwBUZMiJkbin3I6CD8ltykb15bnwP4uNXCciKp
   Lku9ofDe9/xBiNPwFRvyDWsrXmmdWpvvYz2wiRiDpEmfF4rwTCQOkZ+QN
   VHO+nm3zY09gyVdwC+RYG0VbasJGiUY0csoRzIciT2uErUcbwKwBYPBfV
   lCzUkfIDRgAhfAcFnjs7KEgi5KrxQTvq538Y+bJ4bGiMKXw5asct35uW2
   Q==;
X-CSE-ConnectionGUID: Qj2awKqfQ7i+zBustU3NBg==
X-CSE-MsgGUID: CbA6HS/rTSikvifNPn0U+Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11958"; a="2720303"
X-IronPort-AV: E=Sophos;i="6.27,200,1787036400"; 
   d="scan'208";a="2720303"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Nov 2026 05:53:43 -0800
X-CSE-ConnectionGUID: UFkF/+cQTWadgM5819S6sw==
X-CSE-MsgGUID: QWYGVZfkRmO2JeBlDbEBwQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,200,1787036400"; 
   d="scan'208";a="7667132"
Received: from lkp-server01.sh.intel.com (HELO 0caa9d2d175c) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 07 Nov 2026 05:53:38 -0800
Received: from kbuild by 0caa9d2d175c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xPgrP-00000000qtv-44Tp;
	Sat, 07 Nov 2026 13:53:35 +0000
Date: Sat, 07 Nov 2026 21:52:43 +0800
From: kernel test robot <lkp@intel.com>
To: David Woodhouse <dwmw@amazon.co.uk>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [dwmw2:kvmclock12 22/23] arch/x86/kvm/xen.c:253:6: warning:
 variable 'guest_now' is used uninitialized whenever 'if' condition is false
Message-ID: <202611072152.FL5QBzjH-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Post: <mailto:llvm@lists.linux.dev>
List-Help: <mailto:llvm+help@lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
List-Owner: <mailto:llvm+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

tree:   git://git.infradead.org/users/dwmw2/linux kvmclock12
head:   3caa490a421d0b5fdfa4be8c27d439f3069703fd
commit: 193119336b9b67139ba1b762616a3ff78c3b9af8 [22/23] KVM: x86/xen: Drop=
 open-coded fallback clock read in kvm_xen_start_timer()
config: i386-buildonly-randconfig-1004-20261107 (https://download.01.org/0d=
ay-ci/archive/20261107/202611072152.FL5QBzjH-lkp@intel.com/config)
compiler: clang version 22.1.8 (https://github.com/llvm/llvm-project ca7933=
e47d3a3451d81e72ac174dcb5aa28b59d1)
reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archive=
/20261107/202611072152.FL5QBzjH-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new versio=
n of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202611072152.FL5QBzjH-lkp@i=
ntel.com/

All warnings (new ones prefixed by >>):

>> arch/x86/kvm/xen.c:253:6: warning: variable 'guest_now' is used uninitia=
lized whenever 'if' condition is false [-Wsometimes-uninitialized]
     253 |         if (r) {
         |             ^
   arch/x86/kvm/xen.c:273:22: note: uninitialized use occurs here
     273 |         delta =3D guest_abs - guest_now;
         |                             ^~~~~~~~~
   arch/x86/kvm/xen.c:253:2: note: remove the 'if' if its condition is alwa=
ys true
     253 |         if (r) {
         |         ^~~~~~
   arch/x86/kvm/xen.c:190:20: note: initialize the variable 'guest_now' to =
silence this warning
     190 |         uint64_t guest_now;
         |                           ^
         |                            =3D 0
   1 warning generated.


vim +253 arch/x86/kvm/xen.c

ca28aa63918b30 Sean Christopherson   2025-01-31  184 =20
451a707813aee2 David Woodhouse       2024-02-27  185  static void kvm_xen_s=
tart_timer(struct kvm_vcpu *vcpu, u64 guest_abs,
451a707813aee2 David Woodhouse       2024-02-27  186  				bool linux_wa)
536395260582be Joao Martins          2022-03-03  187  {
ca28aa63918b30 Sean Christopherson   2025-01-31  188  	struct kvm_vcpu_xen =
*xen =3D &vcpu->arch.xen;
451a707813aee2 David Woodhouse       2024-02-27  189  	int64_t kernel_now, =
delta;
451a707813aee2 David Woodhouse       2024-02-27  190  	uint64_t guest_now;
ca28aa63918b30 Sean Christopherson   2025-01-31  191  	int r =3D -EOPNOTSUP=
P;
451a707813aee2 David Woodhouse       2024-02-27  192 =20
451a707813aee2 David Woodhouse       2024-02-27  193  	/*
451a707813aee2 David Woodhouse       2024-02-27  194  	 * The guest provide=
s the requested timeout in absolute nanoseconds
451a707813aee2 David Woodhouse       2024-02-27  195  	 * of the KVM clock =
=E2=80=94 as *it* sees it, based on the scaled TSC and
451a707813aee2 David Woodhouse       2024-02-27  196  	 * the pvclock infor=
mation provided by KVM.
451a707813aee2 David Woodhouse       2024-02-27  197  	 *
451a707813aee2 David Woodhouse       2024-02-27  198  	 * The kernel doesn'=
t support hrtimers based on CLOCK_MONOTONIC_RAW
451a707813aee2 David Woodhouse       2024-02-27  199  	 * so use CLOCK_MONO=
TONIC. In the timescales covered by timers, the
451a707813aee2 David Woodhouse       2024-02-27  200  	 * difference won't =
matter much as there is no cumulative effect.
451a707813aee2 David Woodhouse       2024-02-27  201  	 *
451a707813aee2 David Woodhouse       2024-02-27  202  	 * Calculate the tim=
e for some arbitrary point in time around "now"
451a707813aee2 David Woodhouse       2024-02-27  203  	 * in terms of both =
kvmclock and CLOCK_MONOTONIC. Calculate the
451a707813aee2 David Woodhouse       2024-02-27  204  	 * delta between the=
 kvmclock "now" value and the guest's requested
451a707813aee2 David Woodhouse       2024-02-27  205  	 * timeout, apply th=
e "Linux workaround" described below, and add
451a707813aee2 David Woodhouse       2024-02-27  206  	 * the resulting del=
ta to the CLOCK_MONOTONIC "now" value, to get
451a707813aee2 David Woodhouse       2024-02-27  207  	 * the absolute CLOC=
K_MONOTONIC time at which the timer should
451a707813aee2 David Woodhouse       2024-02-27  208  	 * fire.
451a707813aee2 David Woodhouse       2024-02-27  209  	 */
ca28aa63918b30 Sean Christopherson   2025-01-31  210  	do {
ca28aa63918b30 Sean Christopherson   2025-01-31  211  		struct pvclock_vcpu=
_time_info hv_clock;
451a707813aee2 David Woodhouse       2024-02-27  212  		uint64_t host_tsc, =
guest_tsc;
451a707813aee2 David Woodhouse       2024-02-27  213 =20
3eaa50e1e255ec Borislav Petkov (AMD  2026-06-19  214) 		if (!cpu_feature_en=
abled(X86_FEATURE_CONSTANT_TSC) ||
ca28aa63918b30 Sean Christopherson   2025-01-31  215  		    !vcpu->kvm->arc=
h.use_master_clock)
ca28aa63918b30 Sean Christopherson   2025-01-31  216  			break;
ca28aa63918b30 Sean Christopherson   2025-01-31  217 =20
ca28aa63918b30 Sean Christopherson   2025-01-31  218  		/*
ca28aa63918b30 Sean Christopherson   2025-01-31  219  		 * If both Xen PV c=
locks are active, arbitrarily try to use the
ca28aa63918b30 Sean Christopherson   2025-01-31  220  		 * compat clock fir=
st, but also try to use the non-compat clock
ca28aa63918b30 Sean Christopherson   2025-01-31  221  		 * if the compat cl=
ock is unusable.  The two PV clocks hold the
ca28aa63918b30 Sean Christopherson   2025-01-31  222  		 * same information=
, but it's possible one (or both) is stale
ca28aa63918b30 Sean Christopherson   2025-01-31  223  		 * and/or currently=
 unreachable.
ca28aa63918b30 Sean Christopherson   2025-01-31  224  		 */
ca28aa63918b30 Sean Christopherson   2025-01-31  225  		if (xen->vcpu_info_=
cache.active)
ca28aa63918b30 Sean Christopherson   2025-01-31  226  			r =3D xen_get_gues=
t_pvclock(vcpu, &hv_clock, &xen->vcpu_info_cache,
ca28aa63918b30 Sean Christopherson   2025-01-31  227  						  offsetof(stru=
ct compat_vcpu_info, time));
ca28aa63918b30 Sean Christopherson   2025-01-31  228  		if (r && xen->vcpu_=
time_info_cache.active)
ca28aa63918b30 Sean Christopherson   2025-01-31  229  			r =3D xen_get_gues=
t_pvclock(vcpu, &hv_clock, &xen->vcpu_time_info_cache, 0);
ca28aa63918b30 Sean Christopherson   2025-01-31  230  		if (r)
ca28aa63918b30 Sean Christopherson   2025-01-31  231  			break;
ca28aa63918b30 Sean Christopherson   2025-01-31  232 =20
451a707813aee2 David Woodhouse       2024-02-27  233  		/*
193119336b9b67 David Woodhouse       2026-10-16  234  		 * With use_master_=
clock set, the clocksource was TSC-based
193119336b9b67 David Woodhouse       2026-10-16  235  		 * when the master =
clock was last updated. The clockread can
193119336b9b67 David Woodhouse       2026-10-16  236  		 * only fail here i=
f the clocksource has changed since, in
193119336b9b67 David Woodhouse       2026-10-16  237  		 * which case a mas=
terclock update is already pending and
193119336b9b67 David Woodhouse       2026-10-16  238  		 * get_kvmclock_ns(=
) returns the raw-clock fallback value =E2=80=94
193119336b9b67 David Woodhouse       2026-10-16  239  		 * continuous with =
the last valid snapshot, which is as good
193119336b9b67 David Woodhouse       2026-10-16  240  		 * as it gets in th=
at transient window.
451a707813aee2 David Woodhouse       2024-02-27  241  		 */
193119336b9b67 David Woodhouse       2026-10-16  242  		if (!IS_ENABLED(CON=
FIG_64BIT) ||
193119336b9b67 David Woodhouse       2026-10-16  243  		    !kvm_get_monoto=
nic_and_clockread(&kernel_now, &host_tsc)) {
193119336b9b67 David Woodhouse       2026-10-16  244  			r =3D -EOPNOTSUPP;
193119336b9b67 David Woodhouse       2026-10-16  245  			break;
451a707813aee2 David Woodhouse       2024-02-27  246  		}
451a707813aee2 David Woodhouse       2024-02-27  247 =20
451a707813aee2 David Woodhouse       2024-02-27  248  		/* Calculate the gu=
est kvmclock as the guest would do it. */
451a707813aee2 David Woodhouse       2024-02-27  249  		guest_tsc =3D kvm_r=
ead_l1_tsc(vcpu, host_tsc);
ca28aa63918b30 Sean Christopherson   2025-01-31  250  		guest_now =3D __pvc=
lock_read_cycles(&hv_clock, guest_tsc);
ca28aa63918b30 Sean Christopherson   2025-01-31  251  	} while (0);
ca28aa63918b30 Sean Christopherson   2025-01-31  252 =20
ca28aa63918b30 Sean Christopherson   2025-01-31 @253  	if (r) {
451a707813aee2 David Woodhouse       2024-02-27  254  		/*
193119336b9b67 David Woodhouse       2026-10-16  255  		 * Without CONSTANT=
_TSC and the master clock,
193119336b9b67 David Woodhouse       2026-10-16  256  		 * get_kvmclock_ns(=
) is the only option.
451a707813aee2 David Woodhouse       2024-02-27  257  		 *
451a707813aee2 David Woodhouse       2024-02-27  258  		 * Also if the gues=
t PV clock hasn't been set up yet, as is
451a707813aee2 David Woodhouse       2024-02-27  259  		 * likely to be the=
 case during migration when the vCPU has
451a707813aee2 David Woodhouse       2024-02-27  260  		 * not been run yet=
. It would be possible to calculate the
451a707813aee2 David Woodhouse       2024-02-27  261  		 * scaling factors =
properly in that case but there's not much
193119336b9b67 David Woodhouse       2026-10-16  262  		 * point in doing s=
o. Without the master clock, the
193119336b9b67 David Woodhouse       2026-10-16  263  		 * get_kvmclock_ns(=
) drift accumulates over time, so it's OK
193119336b9b67 David Woodhouse       2026-10-16  264  		 * to use it at sta=
rtup. Besides, on migration there's going
193119336b9b67 David Woodhouse       2026-10-16  265  		 * to be a little b=
it of skew in the precise moment at which
193119336b9b67 David Woodhouse       2026-10-16  266  		 * timers fire anyw=
ay. Often they'll be in the "past" by the
193119336b9b67 David Woodhouse       2026-10-16  267  		 * time the VM is r=
unning again after migration.
451a707813aee2 David Woodhouse       2024-02-27  268  		 */
451a707813aee2 David Woodhouse       2024-02-27  269  		guest_now =3D get_k=
vmclock_ns(vcpu->kvm);
451a707813aee2 David Woodhouse       2024-02-27  270  		kernel_now =3D ktim=
e_get();
451a707813aee2 David Woodhouse       2024-02-27  271  	}
451a707813aee2 David Woodhouse       2024-02-27  272 =20
451a707813aee2 David Woodhouse       2024-02-27  273  	delta =3D guest_abs =
- guest_now;
451a707813aee2 David Woodhouse       2024-02-27  274 =20
451a707813aee2 David Woodhouse       2024-02-27  275  	/*
451a707813aee2 David Woodhouse       2024-02-27  276  	 * Xen has a 'Linux =
workaround' in do_set_timer_op() which checks for
451a707813aee2 David Woodhouse       2024-02-27  277  	 * negative absolute=
 timeout values (caused by integer overflow), and
451a707813aee2 David Woodhouse       2024-02-27  278  	 * for values about =
13 days in the future (2^50ns) which would be
451a707813aee2 David Woodhouse       2024-02-27  279  	 * caused by jiffies=
 overflow. For those cases, Xen sets the timeout
451a707813aee2 David Woodhouse       2024-02-27  280  	 * 100ms in the futu=
re (not *too* soon, since if a guest really did
451a707813aee2 David Woodhouse       2024-02-27  281  	 * set a long timeou=
t on purpose we don't want to keep churning CPU
451a707813aee2 David Woodhouse       2024-02-27  282  	 * time by waking it=
 up).  Emulate Xen's workaround when starting the
451a707813aee2 David Woodhouse       2024-02-27  283  	 * timer in response=
 to __HYPERVISOR_set_timer_op.
451a707813aee2 David Woodhouse       2024-02-27  284  	 */
451a707813aee2 David Woodhouse       2024-02-27  285  	if (linux_wa &&
451a707813aee2 David Woodhouse       2024-02-27  286  	    unlikely((int64_=
t)guest_abs < 0 ||
451a707813aee2 David Woodhouse       2024-02-27  287  		     (delta > 0 && =
(uint32_t) (delta >> 50) !=3D 0))) {
451a707813aee2 David Woodhouse       2024-02-27  288  		delta =3D 100 * NSE=
C_PER_MSEC;
451a707813aee2 David Woodhouse       2024-02-27  289  		guest_abs =3D guest=
_now + delta;
451a707813aee2 David Woodhouse       2024-02-27  290  	}
451a707813aee2 David Woodhouse       2024-02-27  291 =20
77c9b9dea4fb3e David Woodhouse       2023-09-30  292  	/*
77c9b9dea4fb3e David Woodhouse       2023-09-30  293  	 * Avoid races with =
the old timer firing. Checking timer_expires
77c9b9dea4fb3e David Woodhouse       2023-09-30  294  	 * to avoid calling =
hrtimer_cancel() will only have false positives
77c9b9dea4fb3e David Woodhouse       2023-09-30  295  	 * so is fine.
77c9b9dea4fb3e David Woodhouse       2023-09-30  296  	 */
77c9b9dea4fb3e David Woodhouse       2023-09-30  297  	if (vcpu->arch.xen.t=
imer_expires)
77c9b9dea4fb3e David Woodhouse       2023-09-30  298  		hrtimer_cancel(&vcp=
u->arch.xen.timer);
77c9b9dea4fb3e David Woodhouse       2023-09-30  299 =20
536395260582be Joao Martins          2022-03-03  300  	atomic_set(&vcpu->ar=
ch.xen.timer_pending, 0);
536395260582be Joao Martins          2022-03-03  301  	vcpu->arch.xen.timer=
_expires =3D guest_abs;
536395260582be Joao Martins          2022-03-03  302 =20
451a707813aee2 David Woodhouse       2024-02-27  303  	if (delta <=3D 0)
536395260582be Joao Martins          2022-03-03  304  		xen_timer_callback(=
&vcpu->arch.xen.timer);
451a707813aee2 David Woodhouse       2024-02-27  305  	else
536395260582be Joao Martins          2022-03-03  306  		hrtimer_start(&vcpu=
->arch.xen.timer,
451a707813aee2 David Woodhouse       2024-02-27  307  			      ktime_add_ns=
(kernel_now, delta),
536395260582be Joao Martins          2022-03-03  308  			      HRTIMER_MODE=
_ABS_HARD);
536395260582be Joao Martins          2022-03-03  309  }
536395260582be Joao Martins          2022-03-03  310 =20

:::::: The code at line 253 was first introduced by commit
:::::: ca28aa63918b304d77803d5ae952ed875fdad56b KVM: x86/xen: Use guest's c=
opy of pvclock when starting timer

:::::: TO: Sean Christopherson <seanjc@google.com>
:::::: CC: Sean Christopherson <seanjc@google.com>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
