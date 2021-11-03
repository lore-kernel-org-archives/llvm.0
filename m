Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52A932C96
	for <llvm@lists.linux.dev>; Wed,  3 Nov 2021 14:09:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1635948568;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=dQ6G3d5+uu70MxKbEdWCzsWi9m3ph52WbGHDDFOgdSg=;
	b=VidABGfhzzdGxBq7N2o7NOl6vNYsiw9QWJwPfHJk1j7nDVn/ouh5WQnU/VneGnRk5nMBM0
	t1IC7qfupNF/Z+RN3FFf/N0MYau8j7UZFOqr1xGNJRqvz+AJyodYwK3s5lVZ/0ufegMZnQ
	pdKns2nRYXRImBoUbZZh4tr/IvQfD2w=
Received: from mail-oo1-f72.google.com (mail-oo1-f72.google.com
 [209.85.161.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-17-xuHzqHaEPtin_m8Nd-atXQ-1; Wed, 03 Nov 2021 10:09:24 -0400
X-MC-Unique: xuHzqHaEPtin_m8Nd-atXQ-1
Received: by mail-oo1-f72.google.com with SMTP id i21-20020a056820013500b002bd110576aaso150800ood.12
        for <llvm@lists.linux.dev>; Wed, 03 Nov 2021 07:09:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=dQ6G3d5+uu70MxKbEdWCzsWi9m3ph52WbGHDDFOgdSg=;
        b=pMBjIFfZJY4qvTrlDcpDazAE2pWAF/cmjAr7RNuoTPMqDGeeG3tk5M+lIal71rNT8I
         Tj0bh/yzLu4/pVTNyyVkoyLf+Je2m8eAki37PMVBKTsVo+pLBy0LaGcPy/03WAmza+rS
         /dj+yuNVc49ZLQGrj1zp3OSyHF9qQD1v8+4B7gS7Cb751gsuySL8Iq65CpsLOKE37loX
         Fuz9wWi8FEISPLcHrGfsQ0xi4P2GlYBrAEac9MQGZU7Ks1L+gTfZv/c1iHKfbd9jH490
         pBDmNUlhneH7vLduloKRk1deqzhvIWK83QLvHrHIuuBPC1VsJYb6xzLwHl72MSZ0YN66
         UFng==
X-Gm-Message-State: AOAM532ybqhIbckxjA2GQV3s5um9z2P+Qd9AZGE+sSbvJSaHz84bYwvO
	hGJ93Y2MjJDNhwwPnPdKM+kwwmSUWfUD80+gmkl2ueeU3vaSbFKGD3ntIa3bYBVlqFP2cjjtYs3
	k4Mbex9A4ScbvsxhUJONs4olZPmop3Q==
X-Received: by 2002:a05:6830:144d:: with SMTP id w13mr22423526otp.163.1635948562924;
        Wed, 03 Nov 2021 07:09:22 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwdDQWvsUG9TjWycJdEIl7WVYvPS8I18694Ul8g0vNknOU8CfJmZJKniQh0Adu9IkYk1iOWLQFeJxiuVWIzwYI=
X-Received: by 2002:a05:6830:144d:: with SMTP id w13mr22423440otp.163.1635948561852;
 Wed, 03 Nov 2021 07:09:21 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <cki.7NLOKEQ46S3PFWKCYAY3@redhat.com>
In-Reply-To: <cki.7NLOKEQ46S3PFWKCYAY3@redhat.com>
From: Bruno Goncalves <bgoncalv@redhat.com>
Date: Wed, 3 Nov 2021 15:09:10 +0100
Message-ID: <CA+QYu4psxwkzCEfV8xRD9Kii--ybnfmk6FAzsHJhKUsyh+p6Ag@mail.gmail.com>
Subject: =?UTF-8?Q?Re=3A_=E2=9D=8C_FAIL=3A_Test_report_for_kernel_5=2E15=2E0_=28mainlin?=
	=?UTF-8?Q?e=2Ekernel=2Eorg=2Dclang=2C_8bb7eca9=29?=
To: llvm@lists.linux.dev
Cc: CKI Project <cki-project@redhat.com>, Ondrej Mosnacek <omosnace@redhat.com>
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=bgoncalv@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello,

During CKI selinux-policy: serge-testsuite [1] we've noticed it causes
some call traces like below on clag build. Full smeg on [2], more
examples of failures can be found on cki issue tracker [3].

[ 7217.197364] request_module() returned: -13
[ 7217.386203] tun: Universal TUN/TAP device driver, 1.6
[ 7217.699795] ------------[ cut here ]------------
[ 7217.699799] WARNING: CPU: 3 PID: 802427 at
arch/x86/kernel/ftrace.c:96 ftrace_replace_code+0xe0/0x1b0
[ 7217.699809] Modules linked in: tun af_key crypto_user
scsi_transport_iscsi xt_multiport ip_gre ip_tunnel gre bluetooth
ecdh_generic overlay xt_CONNSECMARK xt_SECMARK nft_counter xt_state
xt_conntrack nft_compat ah6 ah4 nft_objref nft_ct nf_conntrack
nf_defrag_ipv6 nf_defrag_ipv4 nf_tables nfnetlink vfat fat jfs sctp
ip6_udp_tunnel udp_tunnel ipmi_si ipmi_watchdog ipmi_poweroff
ipmi_ssif ipmi_devintf ipmi_msghandler nls_utf8 cifs cifs_arc4
cifs_md4 rpcsec_gss_krb5 nfsv4 dns_resolver nfs fscache netfs rpcrdma
rdma_cm iw_cm ib_cm ib_core nfsd auth_rpcgss nfs_acl lockd grace
dm_log_writes tls rfkill intel_rapl_msr intel_rapl_common sb_edac
sunrpc x86_pkg_temp_thermal intel_powerclamp coretemp kvm_intel
iTCO_wdt kvm intel_pmc_bxt iTCO_vendor_support irqbypass ses enclosure
rapl intel_cstate pcspkr intel_uncore lpc_ich be2net ioatdma i2c_i801
i2c_smbus dca fuse zram ip_tables xfs mgag200 crct10dif_pclmul
i2c_algo_bit crc32_pclmul crc32c_intel drm_kms_helper qla2xxx
ghash_clmulni_intel cec drm
[ 7217.699883]  nvme_fc mpt3sas nvme_fabrics nvme_core raid_class
scsi_transport_fc scsi_transport_sas wmi [last unloaded:
setest_module_request]
[ 7217.699892] CPU: 3 PID: 802427 Comm: perf_event Tainted: G
 OE     5.15.0 #1
[ 7217.699895] Hardware name: IBM BladeCenter HS23
-[7875B6G]-/00FG956, BIOS -[TKE140YUS-1.60]- 05/14/2014
[ 7217.699897] RIP: 0010:ftrace_replace_code+0xe0/0x1b0
[ 7217.699901] Code: 89 f7 e8 73 c9 25 00 48 85 c0 0f 85 ca 00 00 00
8b 44 24 03 33 45 00 0f b6 4c 24 07 32 4d 04 0f b6 c9 09 c1 0f 84 50
ff ff ff <0f> 0b bf ea ff ff ff e9 ab 00 00 00 e8 7f ee 18 00 48 85 c0
0f 84
[ 7217.699904] RSP: 0018:ffffa8f8831e7c88 EFLAGS: 00010282
[ 7217.699907] RAX: 00000000f971946a RBX: ffffffff8c475970 RCX: 00000000f97=
1947f
[ 7217.699909] RDX: 0000000000000005 RSI: 0000000000000005 RDI: ffffffff8a0=
39750
[ 7217.699910] RBP: ffffffff8b20344a R08: 0000000020000002 R09: 00000000000=
00000
[ 7217.699912] R10: 0000000000000001 R11: 0000000080000000 R12: ffff8bd1800=
83e40
[ 7217.699914] R13: ffff8bd180fc4730 R14: ffffa8f8831e7c8b R15: 00000000000=
00001
[ 7217.699915] FS:  00007f90feba0800(0000) GS:ffff8bea97ac0000(0000)
knlGS:0000000000000000
[ 7217.699918] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[ 7217.699920] CR2: 00007f90fedde421 CR3: 000000033d89c003 CR4: 00000000001=
706e0
[ 7217.699922] Call Trace:
[ 7217.699927]  ftrace_modify_all_code+0x3d/0xe0
[ 7217.699933]  ftrace_startup+0xb1/0x120
[ 7217.699937]  register_ftrace_function+0x45/0x60
[ 7217.699941]  perf_trace_event_init+0x6d/0x320
[ 7217.699946]  perf_trace_init+0x90/0xd0
[ 7217.699950]  perf_tp_event_init+0x28/0x40
[ 7217.699955]  perf_try_init_event+0xdd/0x180
[ 7217.699959]  perf_event_alloc+0x4d2/0xa60
[ 7217.699962]  __se_sys_perf_event_open+0x2ae/0x11a0
[ 7217.699967]  do_syscall_64+0x43/0x90
[ 7217.699972]  entry_SYSCALL_64_after_hwframe+0x44/0xae
[ 7217.699977] RIP: 0033:0x7f90fed44c8d
[ 7217.699980] Code: 5b 41 5c c3 66 0f 1f 84 00 00 00 00 00 f3 0f 1e
fa 48 89 f8 48 89 f7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24
08 0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 8b 0d 6b f1 0e 00 f7 d8 64 89
01 48
[ 7217.699982] RSP: 002b:00007ffcc18f3a88 EFLAGS: 00000206 ORIG_RAX:
000000000000012a
[ 7217.699985] RAX: ffffffffffffffda RBX: 0000000000000000 RCX: 00007f90fed=
44c8d
[ 7217.699987] RDX: 0000000000000000 RSI: 00000000ffffffff RDI: 00007ffcc18=
f3ad0
[ 7217.699988] RBP: 00007ffcc18f3ab0 R08: 0000000000000000 R09: 00000000000=
00000
[ 7217.699989] R10: 00000000ffffffff R11: 0000000000000206 R12: 00007ffcc18=
f3cd8
[ 7217.699991] R13: 00000000004012bd R14: 00007f90feea8b80 R15: 00000000004=
03e08
[ 7217.699994] ---[ end trace 0d67c944b28625a4 ]---
[ 7217.699996] ------------[ ftrace bug ]------------
[ 7217.699997] ftrace failed to modify
[ 7217.699998] [<ffffffff8a039750>] calibrate_delay_is_known+0x0/0x50
[ 7217.700005]  actual:   65:ffffff8b:35:fffffff9:7d
[ 7217.700009] Setting ftrace call site to call ftrace function
[ 7217.700010] ftrace record flags: 10000001
[ 7217.700012]  (1)
                expected tramp: ffffffff8a0740f0
[ 7217.700018] ------------[ cut here ]------------
[ 7217.700019] WARNING: CPU: 3 PID: 802427 at
kernel/trace/ftrace.c:2072 ftrace_bug+0xf8/0x260
[ 7217.700024] Modules linked in: tun af_key crypto_user
scsi_transport_iscsi xt_multiport ip_gre ip_tunnel gre bluetooth
ecdh_generic overlay xt_CONNSECMARK xt_SECMARK nft_counter xt_state
xt_conntrack nft_compat ah6 ah4 nft_objref nft_ct nf_conntrack
nf_defrag_ipv6 nf_defrag_ipv4 nf_tables nfnetlink vfat fat jfs sctp
ip6_udp_tunnel udp_tunnel ipmi_si ipmi_watchdog ipmi_poweroff
ipmi_ssif ipmi_devintf ipmi_msghandler nls_utf8 cifs cifs_arc4
cifs_md4 rpcsec_gss_krb5 nfsv4 dns_resolver nfs fscache netfs rpcrdma
rdma_cm iw_cm ib_cm ib_core nfsd auth_rpcgss nfs_acl lockd grace
dm_log_writes tls rfkill intel_rapl_msr intel_rapl_common sb_edac
sunrpc x86_pkg_temp_thermal intel_powerclamp coretemp kvm_intel
iTCO_wdt kvm intel_pmc_bxt iTCO_vendor_support irqbypass ses enclosure
rapl intel_cstate pcspkr intel_uncore lpc_ich be2net ioatdma i2c_i801
i2c_smbus dca fuse zram ip_tables xfs mgag200 crct10dif_pclmul
i2c_algo_bit crc32_pclmul crc32c_intel drm_kms_helper qla2xxx
ghash_clmulni_intel cec drm
[ 7217.700080]  nvme_fc mpt3sas nvme_fabrics nvme_core raid_class
scsi_transport_fc scsi_transport_sas wmi [last unloaded:
setest_module_request]
[ 7217.700087] CPU: 3 PID: 802427 Comm: perf_event Tainted: G        W
 OE     5.15.0 #1
[ 7217.700090] Hardware name: IBM BladeCenter HS23
-[7875B6G]-/00FG956, BIOS -[TKE140YUS-1.60]- 05/14/2014
[ 7217.700091] RIP: 0010:ftrace_bug+0xf8/0x260
[ 7217.700095] Code: 12 5e 8b 48 c7 c6 ff 8a 5e 8b 48 89 da 48 89 d9
31 c0 e8 37 99 b0 00 8b 05 a9 3a 27 02 83 c0 ff 83 f8 03 76 2a 4d 85
f6 75 3b <0f> 0b c6 05 1b 8f 94 01 01 c7 05 0d 8f 94 01 00 00 00 00 48
c7 05
[ 7217.700097] RSP: 0018:ffffa8f8831e7c60 EFLAGS: 00010282
[ 7217.700099] RAX: 0000000000000022 RBX: ffffffff8a039750 RCX: 00000000000=
00027
[ 7217.700101] RDX: 0000000000000000 RSI: ffffa8f8831e7ab0 RDI: ffff8bea97a=
d88c8
[ 7217.700102] RBP: 00000000ffffffea R08: 0000000000000000 R09: ffffffff8b8=
925d0
[ 7217.700104] R10: 00000000fffffc84 R11: ffffffff8b8625d0 R12: ffff8bd1800=
83e40
[ 7217.700105] R13: ffff8bd180fc4730 R14: ffff8bd180083e40 R15: 00000000000=
00001
[ 7217.700107] FS:  00007f90feba0800(0000) GS:ffff8bea97ac0000(0000)
knlGS:0000000000000000
[ 7217.700109] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[ 7217.700111] CR2: 00007f90fedde421 CR3: 000000033d89c003 CR4: 00000000001=
706e0
[ 7217.700112] Call Trace:
[ 7217.700114]  ftrace_replace_code+0x19f/0x1b0
[ 7217.700118]  ftrace_modify_all_code+0x3d/0xe0
[ 7217.700122]  ftrace_startup+0xb1/0x120
[ 7217.700126]  register_ftrace_function+0x45/0x60
[ 7217.700130]  perf_trace_event_init+0x6d/0x320
[ 7217.700133]  perf_trace_init+0x90/0xd0
[ 7217.700136]  perf_tp_event_init+0x28/0x40
[ 7217.700139]  perf_try_init_event+0xdd/0x180
[ 7217.700143]  perf_event_alloc+0x4d2/0xa60
[ 7217.700147]  __se_sys_perf_event_open+0x2ae/0x11a0
[ 7217.700151]  do_syscall_64+0x43/0x90
[ 7217.700155]  entry_SYSCALL_64_after_hwframe+0x44/0xae
[ 7217.700158] RIP: 0033:0x7f90fed44c8d
[ 7217.700160] Code: 5b 41 5c c3 66 0f 1f 84 00 00 00 00 00 f3 0f 1e
fa 48 89 f8 48 89 f7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24
08 0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 8b 0d 6b f1 0e 00 f7 d8 64 89
01 48
[ 7217.700162] RSP: 002b:00007ffcc18f3a88 EFLAGS: 00000206 ORIG_RAX:
000000000000012a
[ 7217.700164] RAX: ffffffffffffffda RBX: 0000000000000000 RCX: 00007f90fed=
44c8d
[ 7217.700165] RDX: 0000000000000000 RSI: 00000000ffffffff RDI: 00007ffcc18=
f3ad0
[ 7217.700167] RBP: 00007ffcc18f3ab0 R08: 0000000000000000 R09: 00000000000=
00000
[ 7217.700168] R10: 00000000ffffffff R11: 0000000000000206 R12: 00007ffcc18=
f3cd8
[ 7217.700170] R13: 00000000004012bd R14: 00007f90feea8b80 R15: 00000000004=
03e08
[ 7217.700172] ---[ end trace 0d67c944b28625a5 ]---


[1] https://gitlab.com/cki-project/kernel-tests/-/tree/main/packages/selinu=
x-policy/serge-testsuite
[2] https://s3.us-east-1.amazonaws.com/arr-cki-prod-datawarehouse-public/da=
tawarehouse-public/2021/10/31/399132725/build_x86_64_redhat:1733526818/test=
s/selinux_policy_serge_testsuite/10904095_x86_64_1_dmesg.log
[3] https://datawarehouse.cki-project.org/issue/717

Thanks,
Bruno

On Tue, Nov 2, 2021 at 6:14 PM CKI Project <cki-project@redhat.com> wrote:
>
>
>
> Check out this report and any autotriaged failures in our web dashboard:
>     https://datawarehouse.cki-project.org/kcidb/checkouts/23015
>
> Hello,
>
> We ran automated tests on a recent commit from this kernel tree:
>
>        Kernel repo: https://git.kernel.org/pub/scm/linux/kernel/git/torva=
lds/linux.git
>             Commit: 8bb7eca972ad - Linux 5.15
>
> The results of these automated tests are provided below.
>
>     Overall result: FAILED (see details below)
>              Merge: OK
>            Compile: OK
>  Selftests compile: FAILED
>              Tests: FAILED
>     Targeted tests: NO
>
> All kernel binaries, config files, and logs are available for download he=
re:
>
>   https://arr-cki-prod-datawarehouse-public.s3.amazonaws.com/index.html?p=
refix=3Ddatawarehouse-public/2021/10/31/399132725
>
> One or more kernel tests failed:
>
>     s390x:
>      =E2=9D=8C kdump - sysrq-c
>
>     x86_64:
>      =E2=9D=8C selinux-policy: serge-testsuite
>      =E2=9D=8C trace: ftrace/tracer
>
> We hope that these logs can help you find the problem quickly. For the fu=
ll
> detail on our testing procedures, please scroll to the bottom of this mes=
sage.
>
> Please reply to this email if you have any questions about the tests that=
 we
> ran or if you have any suggestions on how to make future tests more effec=
tive.
>
>         ,-.   ,-.
>        ( C ) ( K )  Continuous
>         `-',-.`-'   Kernel
>           ( I )     Integration
>            `-'
> _________________________________________________________________________=
_____
>
> Compile testing
> ---------------
>
> We compiled the kernel for 5 architectures:
>
>     aarch64:
>       make options: make LLVM=3D1 -j24 INSTALL_MOD_STRIP=3D1 targz-pkg
>
>     ppc64le:
>       make options: make CC=3Dclang LLVM_IAS=3D0 -j24 INSTALL_MOD_STRIP=
=3D1 targz-pkg
>
>     s390x:
>       make options: make CC=3Dclang LLVM_IAS=3D0 -j24 INSTALL_MOD_STRIP=
=3D1 targz-pkg
>
>     x86_64:
>       make options: make LLVM=3D1 -j24 INSTALL_MOD_STRIP=3D1 targz-pkg
>
>     x86_64:
>       make options: make LLVM=3D1 -j24 INSTALL_MOD_STRIP=3D1 targz-pkg
>
>
> We built the following selftests:
>
>   x86_64:
>       net: OK
>       bpf: fail
>       seccomp: OK
>       lkdtm: OK
>       install and packaging: OK
>
> You can find the full log (build-selftests.log) in the artifact storage a=
bove.
>
>
> Hardware testing
> ----------------
> We booted each kernel and ran the following tests:
>
>   aarch64:
>     Host 1:
>
>        =E2=9A=A1 Internal infrastructure issues prevented one or more tes=
ts (marked
>        with =E2=9A=A1=E2=9A=A1=E2=9A=A1) from running on this architectur=
e.
>        This is not the fault of the kernel that was tested.
>
>        =E2=9A=A1=E2=9A=A1=E2=9A=A1 Boot test
>        =E2=9A=A1=E2=9A=A1=E2=9A=A1 Reboot test
>        =E2=9A=A1=E2=9A=A1=E2=9A=A1 xfstests - ext4
>        =E2=9A=A1=E2=9A=A1=E2=9A=A1 xfstests - xfs
>        =E2=9A=A1=E2=9A=A1=E2=9A=A1 IPMI driver test
>        =E2=9A=A1=E2=9A=A1=E2=9A=A1 IPMItool loop stress test
>        =E2=9A=A1=E2=9A=A1=E2=9A=A1 selinux-policy: serge-testsuite
>        =E2=9A=A1=E2=9A=A1=E2=9A=A1 Storage blktests - blk
>        =E2=9A=A1=E2=9A=A1=E2=9A=A1 Storage block - filesystem fio test
>        =E2=9A=A1=E2=9A=A1=E2=9A=A1 Storage block - queue scheduler test
>        =E2=9A=A1=E2=9A=A1=E2=9A=A1 storage: software RAID testing
>        =E2=9A=A1=E2=9A=A1=E2=9A=A1 Storage: swraid mdadm raid_module test
>        =E2=9A=A1=E2=9A=A1=E2=9A=A1 stress: stress-ng - interrupt
>        =E2=9A=A1=E2=9A=A1=E2=9A=A1 stress: stress-ng - cpu
>        =E2=9A=A1=E2=9A=A1=E2=9A=A1 stress: stress-ng - cpu-cache
>        =E2=9A=A1=E2=9A=A1=E2=9A=A1 stress: stress-ng - memory
>        =F0=9F=9A=A7 =E2=9A=A1=E2=9A=A1=E2=9A=A1 Podman system test - as r=
oot
>        =F0=9F=9A=A7 =E2=9A=A1=E2=9A=A1=E2=9A=A1 Podman system test - as u=
ser
>        =F0=9F=9A=A7 =E2=9A=A1=E2=9A=A1=E2=9A=A1 xfstests - btrfs
>        =F0=9F=9A=A7 =E2=9A=A1=E2=9A=A1=E2=9A=A1 Storage blktests - nvme-t=
cp
>        =F0=9F=9A=A7 =E2=9A=A1=E2=9A=A1=E2=9A=A1 stress: stress-ng - os
>
>     Host 2:
>
>        =E2=9A=A1 Internal infrastructure issues prevented one or more tes=
ts (marked
>        with =E2=9A=A1=E2=9A=A1=E2=9A=A1) from running on this architectur=
e.
>        This is not the fault of the kernel that was tested.
>
>        =E2=9A=A1=E2=9A=A1=E2=9A=A1 Boot test
>        =E2=9A=A1=E2=9A=A1=E2=9A=A1 Reboot test
>        =E2=9A=A1=E2=9A=A1=E2=9A=A1 Networking bridge: sanity - mlx5
>        =E2=9A=A1=E2=9A=A1=E2=9A=A1 Ethernet drivers sanity - mlx5
>
>     Host 3:
>
>        =E2=9A=A1 Internal infrastructure issues prevented one or more tes=
ts (marked
>        with =E2=9A=A1=E2=9A=A1=E2=9A=A1) from running on this architectur=
e.
>        This is not the fault of the kernel that was tested.
>
>        =E2=9A=A1=E2=9A=A1=E2=9A=A1 Boot test
>        =E2=9A=A1=E2=9A=A1=E2=9A=A1 Reboot test
>        =E2=9A=A1=E2=9A=A1=E2=9A=A1 ACPI table test
>        =E2=9A=A1=E2=9A=A1=E2=9A=A1 ACPI enabled test
>        =E2=9A=A1=E2=9A=A1=E2=9A=A1 LTP - cve
>        =E2=9A=A1=E2=9A=A1=E2=9A=A1 LTP - sched
>        =E2=9A=A1=E2=9A=A1=E2=9A=A1 LTP - syscalls
>        =E2=9A=A1=E2=9A=A1=E2=9A=A1 LTP - can
>        =E2=9A=A1=E2=9A=A1=E2=9A=A1 LTP - commands
>        =E2=9A=A1=E2=9A=A1=E2=9A=A1 LTP - containers
>        =E2=9A=A1=E2=9A=A1=E2=9A=A1 LTP - dio
>        =E2=9A=A1=E2=9A=A1=E2=9A=A1 LTP - fs
>        =E2=9A=A1=E2=9A=A1=E2=9A=A1 LTP - fsx
>        =E2=9A=A1=E2=9A=A1=E2=9A=A1 LTP - math
>        =E2=9A=A1=E2=9A=A1=E2=9A=A1 LTP - hugetlb
>        =E2=9A=A1=E2=9A=A1=E2=9A=A1 LTP - mm
>        =E2=9A=A1=E2=9A=A1=E2=9A=A1 LTP - nptl
>        =E2=9A=A1=E2=9A=A1=E2=9A=A1 LTP - pty
>        =E2=9A=A1=E2=9A=A1=E2=9A=A1 LTP - ipc
>        =E2=9A=A1=E2=9A=A1=E2=9A=A1 LTP - tracing
>        =E2=9A=A1=E2=9A=A1=E2=9A=A1 LTP: openposix test suite
>        =E2=9A=A1=E2=9A=A1=E2=9A=A1 CIFS Connectathon
>        =E2=9A=A1=E2=9A=A1=E2=9A=A1 POSIX pjd-fstest suites
>        =E2=9A=A1=E2=9A=A1=E2=9A=A1 Loopdev Sanity
>        =E2=9A=A1=E2=9A=A1=E2=9A=A1 jvm - jcstress tests
>        =E2=9A=A1=E2=9A=A1=E2=9A=A1 Memory: fork_mem
>        =E2=9A=A1=E2=9A=A1=E2=9A=A1 Memory function: memfd_create
>        =E2=9A=A1=E2=9A=A1=E2=9A=A1 AMTU (Abstract Machine Test Utility)
>        =E2=9A=A1=E2=9A=A1=E2=9A=A1 Networking bridge: sanity
>        =E2=9A=A1=E2=9A=A1=E2=9A=A1 Ethernet drivers sanity
>        =E2=9A=A1=E2=9A=A1=E2=9A=A1 Networking socket: fuzz
>        =E2=9A=A1=E2=9A=A1=E2=9A=A1 Networking route: pmtu
>        =E2=9A=A1=E2=9A=A1=E2=9A=A1 Networking route_func - local
>        =E2=9A=A1=E2=9A=A1=E2=9A=A1 Networking route_func - forward
>        =E2=9A=A1=E2=9A=A1=E2=9A=A1 Networking TCP: keepalive test
>        =E2=9A=A1=E2=9A=A1=E2=9A=A1 Networking UDP: socket
>        =E2=9A=A1=E2=9A=A1=E2=9A=A1 Networking cki netfilter test
>        =E2=9A=A1=E2=9A=A1=E2=9A=A1 Networking tunnel: geneve basic test
>        =E2=9A=A1=E2=9A=A1=E2=9A=A1 Networking tunnel: gre basic
>        =E2=9A=A1=E2=9A=A1=E2=9A=A1 L2TP basic test
>        =E2=9A=A1=E2=9A=A1=E2=9A=A1 Networking tunnel: vxlan basic
>        =E2=9A=A1=E2=9A=A1=E2=9A=A1 Networking ipsec: basic netns - transp=
ort
>        =E2=9A=A1=E2=9A=A1=E2=9A=A1 Networking ipsec: basic netns - tunnel
>        =E2=9A=A1=E2=9A=A1=E2=9A=A1 Libkcapi AF_ALG test
>        =E2=9A=A1=E2=9A=A1=E2=9A=A1 pciutils: update pci ids test
>        =E2=9A=A1=E2=9A=A1=E2=9A=A1 ALSA PCM loopback test
>        =E2=9A=A1=E2=9A=A1=E2=9A=A1 ALSA Control (mixer) Userspace Element=
 test
>        =E2=9A=A1=E2=9A=A1=E2=9A=A1 storage: dm/common
>        =E2=9A=A1=E2=9A=A1=E2=9A=A1 lvm snapper test
>        =E2=9A=A1=E2=9A=A1=E2=9A=A1 storage: SCSI VPD
>        =E2=9A=A1=E2=9A=A1=E2=9A=A1 trace: ftrace/tracer
>        =E2=9A=A1=E2=9A=A1=E2=9A=A1 kdump - kexec_boot
>        =F0=9F=9A=A7 =E2=9A=A1=E2=9A=A1=E2=9A=A1 xarray-idr-radixtree-test
>        =F0=9F=9A=A7 =E2=9A=A1=E2=9A=A1=E2=9A=A1 i2c: i2cdetect sanity
>        =F0=9F=9A=A7 =E2=9A=A1=E2=9A=A1=E2=9A=A1 Firmware test suite
>        =F0=9F=9A=A7 =E2=9A=A1=E2=9A=A1=E2=9A=A1 Memory function: kaslr
>        =F0=9F=9A=A7 =E2=9A=A1=E2=9A=A1=E2=9A=A1 Networking: igmp conforma=
nce test
>        =F0=9F=9A=A7 =E2=9A=A1=E2=9A=A1=E2=9A=A1 audit: audit testsuite te=
st
>        =F0=9F=9A=A7 =E2=9A=A1=E2=9A=A1=E2=9A=A1 lvm cache test
>
>     Host 4:
>
>        =E2=9A=A1 Internal infrastructure issues prevented one or more tes=
ts (marked
>        with =E2=9A=A1=E2=9A=A1=E2=9A=A1) from running on this architectur=
e.
>        This is not the fault of the kernel that was tested.
>
>        =E2=9A=A1=E2=9A=A1=E2=9A=A1 Boot test
>        =E2=9A=A1=E2=9A=A1=E2=9A=A1 Reboot test
>        =F0=9F=9A=A7 =E2=9A=A1=E2=9A=A1=E2=9A=A1 Storage blktests - nvmeof=
-mp
>
>     Host 5:
>
>        =E2=9A=A1 Internal infrastructure issues prevented one or more tes=
ts (marked
>        with =E2=9A=A1=E2=9A=A1=E2=9A=A1) from running on this architectur=
e.
>        This is not the fault of the kernel that was tested.
>
>        =E2=9A=A1=E2=9A=A1=E2=9A=A1 Boot test
>        =E2=9A=A1=E2=9A=A1=E2=9A=A1 Reboot test
>        =F0=9F=9A=A7 =E2=9A=A1=E2=9A=A1=E2=9A=A1 Storage blktests - srp
>
>     Host 6:
>
>        =E2=9A=A1 Internal infrastructure issues prevented one or more tes=
ts (marked
>        with =E2=9A=A1=E2=9A=A1=E2=9A=A1) from running on this architectur=
e.
>        This is not the fault of the kernel that was tested.
>
>        =E2=9A=A1=E2=9A=A1=E2=9A=A1 Boot test
>        =E2=9A=A1=E2=9A=A1=E2=9A=A1 Reboot test
>        =E2=9A=A1=E2=9A=A1=E2=9A=A1 xfstests - ext4
>        =E2=9A=A1=E2=9A=A1=E2=9A=A1 xfstests - xfs
>        =E2=9A=A1=E2=9A=A1=E2=9A=A1 IPMI driver test
>        =E2=9A=A1=E2=9A=A1=E2=9A=A1 IPMItool loop stress test
>        =E2=9A=A1=E2=9A=A1=E2=9A=A1 selinux-policy: serge-testsuite
>        =E2=9A=A1=E2=9A=A1=E2=9A=A1 Storage blktests - blk
>        =E2=9A=A1=E2=9A=A1=E2=9A=A1 Storage block - filesystem fio test
>        =E2=9A=A1=E2=9A=A1=E2=9A=A1 Storage block - queue scheduler test
>        =E2=9A=A1=E2=9A=A1=E2=9A=A1 storage: software RAID testing
>        =E2=9A=A1=E2=9A=A1=E2=9A=A1 Storage: swraid mdadm raid_module test
>        =E2=9A=A1=E2=9A=A1=E2=9A=A1 stress: stress-ng - interrupt
>        =E2=9A=A1=E2=9A=A1=E2=9A=A1 stress: stress-ng - cpu
>        =E2=9A=A1=E2=9A=A1=E2=9A=A1 stress: stress-ng - cpu-cache
>        =E2=9A=A1=E2=9A=A1=E2=9A=A1 stress: stress-ng - memory
>        =F0=9F=9A=A7 =E2=9A=A1=E2=9A=A1=E2=9A=A1 Podman system test - as r=
oot
>        =F0=9F=9A=A7 =E2=9A=A1=E2=9A=A1=E2=9A=A1 Podman system test - as u=
ser
>        =F0=9F=9A=A7 =E2=9A=A1=E2=9A=A1=E2=9A=A1 xfstests - btrfs
>        =F0=9F=9A=A7 =E2=9A=A1=E2=9A=A1=E2=9A=A1 Storage blktests - nvme-t=
cp
>        =F0=9F=9A=A7 =E2=9A=A1=E2=9A=A1=E2=9A=A1 stress: stress-ng - os
>
>     Host 7:
>
>        =E2=9A=A1 Internal infrastructure issues prevented one or more tes=
ts (marked
>        with =E2=9A=A1=E2=9A=A1=E2=9A=A1) from running on this architectur=
e.
>        This is not the fault of the kernel that was tested.
>
>        =E2=9A=A1=E2=9A=A1=E2=9A=A1 Boot test
>        =E2=9A=A1=E2=9A=A1=E2=9A=A1 Reboot test
>        =E2=9A=A1=E2=9A=A1=E2=9A=A1 Networking bridge: sanity - mlx5
>        =E2=9A=A1=E2=9A=A1=E2=9A=A1 Ethernet drivers sanity - mlx5
>
>   ppc64le:
>     Host 1:
>
>        =E2=9A=A1 Internal infrastructure issues prevented one or more tes=
ts (marked
>        with =E2=9A=A1=E2=9A=A1=E2=9A=A1) from running on this architectur=
e.
>        This is not the fault of the kernel that was tested.
>
>        =E2=9A=A1=E2=9A=A1=E2=9A=A1 Boot test
>        =E2=9A=A1=E2=9A=A1=E2=9A=A1 Reboot test
>        =F0=9F=9A=A7 =E2=9A=A1=E2=9A=A1=E2=9A=A1 Storage: lvm device-mappe=
r test - upstream
>
>     Host 2:
>
>        =E2=9A=A1 Internal infrastructure issues prevented one or more tes=
ts (marked
>        with =E2=9A=A1=E2=9A=A1=E2=9A=A1) from running on this architectur=
e.
>        This is not the fault of the kernel that was tested.
>
>        =E2=9A=A1=E2=9A=A1=E2=9A=A1 Boot test
>        =E2=9A=A1=E2=9A=A1=E2=9A=A1 Reboot test
>        =F0=9F=9A=A7 =E2=9A=A1=E2=9A=A1=E2=9A=A1 Storage blktests - srp
>
>     Host 3:
>
>        =E2=9A=A1 Internal infrastructure issues prevented one or more tes=
ts (marked
>        with =E2=9A=A1=E2=9A=A1=E2=9A=A1) from running on this architectur=
e.
>        This is not the fault of the kernel that was tested.
>
>        =E2=9A=A1=E2=9A=A1=E2=9A=A1 Boot test
>        =E2=9A=A1=E2=9A=A1=E2=9A=A1 Reboot test
>        =E2=9A=A1=E2=9A=A1=E2=9A=A1 LTP - cve
>        =E2=9A=A1=E2=9A=A1=E2=9A=A1 LTP - sched
>        =E2=9A=A1=E2=9A=A1=E2=9A=A1 LTP - syscalls
>        =E2=9A=A1=E2=9A=A1=E2=9A=A1 LTP - can
>        =E2=9A=A1=E2=9A=A1=E2=9A=A1 LTP - commands
>        =E2=9A=A1=E2=9A=A1=E2=9A=A1 LTP - containers
>        =E2=9A=A1=E2=9A=A1=E2=9A=A1 LTP - dio
>        =E2=9A=A1=E2=9A=A1=E2=9A=A1 LTP - fs
>        =E2=9A=A1=E2=9A=A1=E2=9A=A1 LTP - fsx
>        =E2=9A=A1=E2=9A=A1=E2=9A=A1 LTP - math
>        =E2=9A=A1=E2=9A=A1=E2=9A=A1 LTP - hugetlb
>        =E2=9A=A1=E2=9A=A1=E2=9A=A1 LTP - mm
>        =E2=9A=A1=E2=9A=A1=E2=9A=A1 LTP - nptl
>        =E2=9A=A1=E2=9A=A1=E2=9A=A1 LTP - pty
>        =E2=9A=A1=E2=9A=A1=E2=9A=A1 LTP - ipc
>        =E2=9A=A1=E2=9A=A1=E2=9A=A1 LTP - tracing
>        =E2=9A=A1=E2=9A=A1=E2=9A=A1 LTP: openposix test suite
>        =E2=9A=A1=E2=9A=A1=E2=9A=A1 CIFS Connectathon
>        =E2=9A=A1=E2=9A=A1=E2=9A=A1 POSIX pjd-fstest suites
>        =E2=9A=A1=E2=9A=A1=E2=9A=A1 Loopdev Sanity
>        =E2=9A=A1=E2=9A=A1=E2=9A=A1 jvm - jcstress tests
>        =E2=9A=A1=E2=9A=A1=E2=9A=A1 Memory: fork_mem
>        =E2=9A=A1=E2=9A=A1=E2=9A=A1 Memory function: memfd_create
>        =E2=9A=A1=E2=9A=A1=E2=9A=A1 AMTU (Abstract Machine Test Utility)
>        =E2=9A=A1=E2=9A=A1=E2=9A=A1 Networking bridge: sanity
>        =E2=9A=A1=E2=9A=A1=E2=9A=A1 Ethernet drivers sanity
>        =E2=9A=A1=E2=9A=A1=E2=9A=A1 Networking socket: fuzz
>        =E2=9A=A1=E2=9A=A1=E2=9A=A1 Networking route: pmtu
>        =E2=9A=A1=E2=9A=A1=E2=9A=A1 Networking route_func - local
>        =E2=9A=A1=E2=9A=A1=E2=9A=A1 Networking route_func - forward
>        =E2=9A=A1=E2=9A=A1=E2=9A=A1 Networking TCP: keepalive test
>        =E2=9A=A1=E2=9A=A1=E2=9A=A1 Networking UDP: socket
>        =E2=9A=A1=E2=9A=A1=E2=9A=A1 Networking cki netfilter test
>        =E2=9A=A1=E2=9A=A1=E2=9A=A1 Networking tunnel: geneve basic test
>        =E2=9A=A1=E2=9A=A1=E2=9A=A1 Networking tunnel: gre basic
>        =E2=9A=A1=E2=9A=A1=E2=9A=A1 L2TP basic test
>        =E2=9A=A1=E2=9A=A1=E2=9A=A1 Networking tunnel: vxlan basic
>        =E2=9A=A1=E2=9A=A1=E2=9A=A1 Networking ipsec: basic netns - tunnel
>        =E2=9A=A1=E2=9A=A1=E2=9A=A1 Libkcapi AF_ALG test
>        =E2=9A=A1=E2=9A=A1=E2=9A=A1 pciutils: update pci ids test
>        =E2=9A=A1=E2=9A=A1=E2=9A=A1 ALSA PCM loopback test
>        =E2=9A=A1=E2=9A=A1=E2=9A=A1 ALSA Control (mixer) Userspace Element=
 test
>        =E2=9A=A1=E2=9A=A1=E2=9A=A1 storage: dm/common
>        =E2=9A=A1=E2=9A=A1=E2=9A=A1 lvm snapper test
>        =E2=9A=A1=E2=9A=A1=E2=9A=A1 trace: ftrace/tracer
>        =F0=9F=9A=A7 =E2=9A=A1=E2=9A=A1=E2=9A=A1 xarray-idr-radixtree-test
>        =F0=9F=9A=A7 =E2=9A=A1=E2=9A=A1=E2=9A=A1 Memory function: kaslr
>        =F0=9F=9A=A7 =E2=9A=A1=E2=9A=A1=E2=9A=A1 audit: audit testsuite te=
st
>        =F0=9F=9A=A7 =E2=9A=A1=E2=9A=A1=E2=9A=A1 lvm cache test
>
>     Host 4:
>
>        =E2=9A=A1 Internal infrastructure issues prevented one or more tes=
ts (marked
>        with =E2=9A=A1=E2=9A=A1=E2=9A=A1) from running on this architectur=
e.
>        This is not the fault of the kernel that was tested.
>
>        =E2=9A=A1=E2=9A=A1=E2=9A=A1 Boot test
>        =E2=9A=A1=E2=9A=A1=E2=9A=A1 Reboot test
>        =F0=9F=9A=A7 =E2=9A=A1=E2=9A=A1=E2=9A=A1 Storage: lvm device-mappe=
r test - upstream
>
>     Host 5:
>
>        =E2=9A=A1 Internal infrastructure issues prevented one or more tes=
ts (marked
>        with =E2=9A=A1=E2=9A=A1=E2=9A=A1) from running on this architectur=
e.
>        This is not the fault of the kernel that was tested.
>
>        =E2=9A=A1=E2=9A=A1=E2=9A=A1 Boot test
>        =E2=9A=A1=E2=9A=A1=E2=9A=A1 Reboot test
>        =F0=9F=9A=A7 =E2=9A=A1=E2=9A=A1=E2=9A=A1 Storage blktests - srp
>
>   s390x:
>     Host 1:
>
>        =E2=9A=A1 Internal infrastructure issues prevented one or more tes=
ts (marked
>        with =E2=9A=A1=E2=9A=A1=E2=9A=A1) from running on this architectur=
e.
>        This is not the fault of the kernel that was tested.
>
>        =E2=9C=85 Boot test
>        =E2=9C=85 Reboot test
>        =E2=9D=8C kdump - sysrq-c
>        =E2=9A=A1=E2=9A=A1=E2=9A=A1 kdump - file-load
>
>     Host 2:
>        =E2=9C=85 Boot test
>        =E2=9C=85 Reboot test
>        =F0=9F=9A=A7 =E2=9D=8C Storage blktests - srp
>
>     Host 3:
>        =E2=9C=85 Boot test
>        =E2=9C=85 Reboot test
>        =E2=9C=85 LTP - cve
>        =E2=9C=85 LTP - sched
>        =E2=9C=85 LTP - syscalls
>        =E2=9C=85 LTP - can
>        =E2=9C=85 LTP - commands
>        =E2=9C=85 LTP - containers
>        =E2=9C=85 LTP - dio
>        =E2=9C=85 LTP - fs
>        =E2=9C=85 LTP - fsx
>        =E2=9C=85 LTP - math
>        =E2=9C=85 LTP - hugetlb
>        =E2=9C=85 LTP - mm
>        =E2=9C=85 LTP - nptl
>        =E2=9C=85 LTP - pty
>        =E2=9C=85 LTP - ipc
>        =E2=9C=85 LTP - tracing
>        =E2=9C=85 LTP: openposix test suite
>        =E2=9C=85 CIFS Connectathon
>        =E2=9C=85 POSIX pjd-fstest suites
>        =E2=9C=85 Loopdev Sanity
>        =E2=9C=85 jvm - jcstress tests
>        =E2=9C=85 Memory: fork_mem
>        =E2=9C=85 Memory function: memfd_create
>        =E2=9C=85 AMTU (Abstract Machine Test Utility)
>        =E2=9C=85 Networking bridge: sanity
>        =E2=9C=85 Ethernet drivers sanity
>        =E2=9C=85 Networking route: pmtu
>        =E2=9C=85 Networking route_func - local
>        =E2=9C=85 Networking route_func - forward
>        =E2=9C=85 Networking TCP: keepalive test
>        =E2=9C=85 Networking UDP: socket
>        =E2=9C=85 Networking cki netfilter test
>        =E2=9C=85 Networking tunnel: geneve basic test
>        =E2=9C=85 Networking tunnel: gre basic
>        =E2=9C=85 L2TP basic test
>        =E2=9C=85 Networking tunnel: vxlan basic
>        =E2=9C=85 Networking ipsec: basic netns - transport
>        =E2=9C=85 Networking ipsec: basic netns - tunnel
>        =E2=9C=85 Libkcapi AF_ALG test
>        =E2=9C=85 storage: dm/common
>        =E2=9C=85 lvm snapper test
>        =E2=9C=85 trace: ftrace/tracer
>        =E2=9C=85 kdump - kexec_boot
>        =F0=9F=9A=A7 =E2=9C=85 xarray-idr-radixtree-test
>        =F0=9F=9A=A7 =E2=9C=85 Memory function: kaslr
>        =F0=9F=9A=A7 =E2=9C=85 audit: audit testsuite test
>        =F0=9F=9A=A7 =E2=9C=85 lvm cache test
>
>     Host 4:
>        =E2=9C=85 Boot test
>        =E2=9C=85 Reboot test
>        =E2=9C=85 selinux-policy: serge-testsuite
>        =E2=9C=85 Storage blktests - blk
>        =E2=9C=85 Storage: swraid mdadm raid_module test
>        =E2=9C=85 stress: stress-ng - interrupt
>        =E2=9C=85 stress: stress-ng - cpu
>        =E2=9C=85 stress: stress-ng - cpu-cache
>        =E2=9C=85 stress: stress-ng - memory
>        =F0=9F=9A=A7 =E2=9C=85 Podman system test - as root
>        =F0=9F=9A=A7 =E2=9C=85 Podman system test - as user
>        =F0=9F=9A=A7 =E2=9C=85 Storage blktests - nvme-tcp
>        =F0=9F=9A=A7 =E2=9C=85 stress: stress-ng - os
>
>     Host 5:
>        =E2=9C=85 Boot test
>        =E2=9C=85 Reboot test
>        =F0=9F=9A=A7 =E2=9C=85 Storage blktests - nvmeof-mp
>
>   x86_64 (debug):
>     Host 1:
>
>        =E2=9A=A1 Internal infrastructure issues prevented one or more tes=
ts (marked
>        with =E2=9A=A1=E2=9A=A1=E2=9A=A1) from running on this architectur=
e.
>        This is not the fault of the kernel that was tested.
>
>        =E2=9C=85 Boot test
>        =E2=9C=85 Reboot test
>        =E2=9C=85 xfstests - ext4
>        =E2=9C=85 xfstests - xfs
>        =E2=9C=85 xfstests - nfsv4.2
>        =E2=9C=85 xfstests - cifsv3.11
>        =E2=9C=85 selinux-policy: serge-testsuite
>        =E2=9C=85 storage: software RAID testing
>        =E2=9C=85 Storage: swraid mdadm raid_module test
>        =E2=9C=85 stress: stress-ng - interrupt
>        =E2=9C=85 stress: stress-ng - cpu
>        =E2=9C=85 stress: stress-ng - cpu-cache
>        =E2=9C=85 stress: stress-ng - memory
>        =F0=9F=9A=A7 =E2=9C=85 CPU: Idle Test
>        =F0=9F=9A=A7 =E2=9C=85 xfstests - btrfs
>        =F0=9F=9A=A7 =E2=9A=A1=E2=9A=A1=E2=9A=A1 Storage: lvm device-mappe=
r test - upstream
>        =F0=9F=9A=A7 =E2=9C=85 stress: stress-ng - os
>
>     Host 2:
>        =E2=9C=85 Boot test
>        =E2=9C=85 Reboot test
>        =E2=9C=85 ACPI table test
>        =E2=9C=85 LTP - cve
>        =E2=9C=85 LTP - sched
>        =E2=9C=85 LTP - syscalls
>        =E2=9C=85 LTP - can
>        =E2=9C=85 LTP - commands
>        =E2=9C=85 LTP - containers
>        =E2=9C=85 LTP - dio
>        =E2=9C=85 LTP - fs
>        =E2=9C=85 LTP - fsx
>        =E2=9C=85 LTP - math
>        =E2=9C=85 LTP - hugetlb
>        =E2=9C=85 LTP - mm
>        =E2=9C=85 LTP - nptl
>        =E2=9C=85 LTP - pty
>        =E2=9C=85 LTP - ipc
>        =E2=9C=85 LTP - tracing
>        =E2=9C=85 LTP: openposix test suite
>        =E2=9C=85 CIFS Connectathon
>        =E2=9C=85 POSIX pjd-fstest suites
>        =E2=9C=85 Loopdev Sanity
>        =E2=9C=85 Memory: fork_mem
>        =E2=9C=85 Memory function: memfd_create
>        =E2=9C=85 AMTU (Abstract Machine Test Utility)
>        =E2=9C=85 Ethernet drivers sanity
>        =E2=9C=85 Networking socket: fuzz
>        =E2=9C=85 Networking route: pmtu
>        =E2=9C=85 Networking route_func - local
>        =E2=9C=85 Networking route_func - forward
>        =E2=9C=85 Networking TCP: keepalive test
>        =E2=9C=85 Networking UDP: socket
>        =E2=9C=85 Networking cki netfilter test
>        =E2=9C=85 Networking tunnel: geneve basic test
>        =E2=9C=85 Networking tunnel: gre basic
>        =E2=9C=85 L2TP basic test
>        =E2=9C=85 Networking tunnel: vxlan basic
>        =E2=9C=85 Libkcapi AF_ALG test
>        =E2=9C=85 pciutils: sanity smoke test
>        =E2=9C=85 pciutils: update pci ids test
>        =E2=9C=85 storage: dm/common
>        =E2=9C=85 lvm snapper test
>        =E2=9C=85 storage: SCSI VPD
>        =E2=9C=85 trace: ftrace/tracer
>        =F0=9F=9A=A7 =E2=9C=85 xarray-idr-radixtree-test
>        =F0=9F=9A=A7 =E2=9D=8C Firmware test suite
>        =F0=9F=9A=A7 =E2=9D=8C kselftests upstream - net
>        =F0=9F=9A=A7 =E2=9C=85 kselftests upstream - forwarding
>        =F0=9F=9A=A7 =E2=9C=85 kselftests upstream - tc
>        =F0=9F=9A=A7 =E2=9C=85 kselftests upstream - bpf
>        =F0=9F=9A=A7 =E2=9C=85 kselftests upstream - bpf_test_progs
>        =F0=9F=9A=A7 =E2=9C=85 Memory function: kaslr
>        =F0=9F=9A=A7 =E2=9C=85 Networking: igmp conformance test
>        =F0=9F=9A=A7 =E2=9C=85 lvm cache test
>
>   x86_64:
>     Host 1:
>        =E2=9C=85 Boot test
>        =E2=9C=85 Reboot test
>        =F0=9F=9A=A7 =E2=9D=8C Storage blktests - srp
>
>     Host 2:
>
>        =E2=9A=A1 Internal infrastructure issues prevented one or more tes=
ts (marked
>        with =E2=9A=A1=E2=9A=A1=E2=9A=A1) from running on this architectur=
e.
>        This is not the fault of the kernel that was tested.
>
>        =E2=9C=85 Boot test
>        =E2=9C=85 Reboot test
>        =E2=9C=85 xfstests - ext4
>        =E2=9C=85 xfstests - xfs
>        =E2=9C=85 xfstests - nfsv4.2
>        =E2=9C=85 xfstests - cifsv3.11
>        =E2=9C=85 IPMI driver test
>        =E2=9C=85 IPMItool loop stress test
>        =E2=9D=8C selinux-policy: serge-testsuite
>        =E2=9C=85 power-management: cpupower/sanity test
>        =E2=9C=85 Storage blktests - blk
>        =E2=9C=85 Storage block - filesystem fio test
>        =E2=9C=85 Storage block - queue scheduler test
>        =E2=9C=85 storage: software RAID testing
>        =E2=9C=85 Storage: swraid mdadm raid_module test
>        =E2=9C=85 stress: stress-ng - interrupt
>        =E2=9C=85 stress: stress-ng - cpu
>        =E2=9C=85 stress: stress-ng - cpu-cache
>        =E2=9C=85 stress: stress-ng - memory
>        =F0=9F=9A=A7 =E2=9C=85 Podman system test - as root
>        =F0=9F=9A=A7 =E2=9C=85 Podman system test - as user
>        =F0=9F=9A=A7 =E2=9C=85 CPU: Idle Test
>        =F0=9F=9A=A7 =E2=9C=85 xfstests - btrfs
>        =F0=9F=9A=A7 =E2=9C=85 Storage blktests - nvme-tcp
>        =F0=9F=9A=A7 =E2=9A=A1=E2=9A=A1=E2=9A=A1 Storage nvdimm ndctl test=
 suite
>        =F0=9F=9A=A7 =E2=9A=A1=E2=9A=A1=E2=9A=A1 Storage: lvm device-mappe=
r test - upstream
>        =F0=9F=9A=A7 =E2=9C=85 stress: stress-ng - os
>
>     Host 3:
>
>        =E2=9A=A1 Internal infrastructure issues prevented one or more tes=
ts (marked
>        with =E2=9A=A1=E2=9A=A1=E2=9A=A1) from running on this architectur=
e.
>        This is not the fault of the kernel that was tested.
>
>        =E2=9A=A1=E2=9A=A1=E2=9A=A1 Boot test
>        =E2=9A=A1=E2=9A=A1=E2=9A=A1 Reboot test
>        =F0=9F=9A=A7 =E2=9A=A1=E2=9A=A1=E2=9A=A1 Storage blktests - nvmeof=
-mp
>
>     Host 4:
>        =E2=9C=85 Boot test
>        =E2=9C=85 Reboot test
>        =E2=9C=85 kdump - file-load
>        =F0=9F=9A=A7 =E2=9C=85 kdump - sysrq-c
>
>     Host 5:
>        =E2=9C=85 Boot test
>        =E2=9C=85 Reboot test
>        =E2=9C=85 ACPI table test
>        =E2=9C=85 LTP - cve
>        =E2=9C=85 LTP - sched
>        =E2=9C=85 LTP - syscalls
>        =E2=9C=85 LTP - can
>        =E2=9C=85 LTP - commands
>        =E2=9C=85 LTP - containers
>        =E2=9C=85 LTP - dio
>        =E2=9C=85 LTP - fs
>        =E2=9C=85 LTP - fsx
>        =E2=9C=85 LTP - math
>        =E2=9C=85 LTP - hugetlb
>        =E2=9C=85 LTP - mm
>        =E2=9C=85 LTP - nptl
>        =E2=9C=85 LTP - pty
>        =E2=9C=85 LTP - ipc
>        =E2=9C=85 LTP - tracing
>        =E2=9C=85 LTP: openposix test suite
>        =E2=9C=85 CIFS Connectathon
>        =E2=9C=85 POSIX pjd-fstest suites
>        =E2=9C=85 Loopdev Sanity
>        =E2=9C=85 jvm - jcstress tests
>        =E2=9C=85 Memory: fork_mem
>        =E2=9C=85 Memory function: memfd_create
>        =E2=9C=85 AMTU (Abstract Machine Test Utility)
>        =E2=9C=85 Networking bridge: sanity
>        =E2=9C=85 Ethernet drivers sanity
>        =E2=9C=85 Networking socket: fuzz
>        =E2=9C=85 Networking route: pmtu
>        =E2=9C=85 Networking route_func - local
>        =E2=9C=85 Networking route_func - forward
>        =E2=9C=85 Networking TCP: keepalive test
>        =E2=9C=85 Networking UDP: socket
>        =E2=9C=85 Networking cki netfilter test
>        =E2=9C=85 Networking tunnel: geneve basic test
>        =E2=9C=85 Networking tunnel: gre basic
>        =E2=9C=85 L2TP basic test
>        =E2=9C=85 Networking tunnel: vxlan basic
>        =E2=9C=85 Networking ipsec: basic netns - transport
>        =E2=9C=85 Networking ipsec: basic netns - tunnel
>        =E2=9C=85 Libkcapi AF_ALG test
>        =E2=9C=85 pciutils: sanity smoke test
>        =E2=9C=85 pciutils: update pci ids test
>        =E2=9C=85 ALSA PCM loopback test
>        =E2=9C=85 ALSA Control (mixer) Userspace Element test
>        =E2=9C=85 storage: dm/common
>        =E2=9C=85 lvm snapper test
>        =E2=9C=85 storage: SCSI VPD
>        =E2=9D=8C trace: ftrace/tracer
>        =E2=9C=85 kdump - kexec_boot
>        =F0=9F=9A=A7 =E2=9C=85 xarray-idr-radixtree-test
>        =F0=9F=9A=A7 =E2=9C=85 i2c: i2cdetect sanity
>        =F0=9F=9A=A7 =E2=9D=8C Firmware test suite
>        =F0=9F=9A=A7 =E2=9C=85 Memory function: kaslr
>        =F0=9F=9A=A7 =E2=9C=85 Networking: igmp conformance test
>        =F0=9F=9A=A7 =E2=9C=85 audit: audit testsuite test
>        =F0=9F=9A=A7 =E2=9C=85 lvm cache test
>
>     Host 6:
>        =E2=9C=85 Boot test
>        =E2=9C=85 Reboot test
>        =F0=9F=9A=A7 =E2=9C=85 Storage blktests - nvmeof-mp
>
>   Test sources: https://gitlab.com/cki-project/kernel-tests
>     =F0=9F=92=9A Pull requests are welcome for new tests or improvements =
to existing tests!
>
> Aborted tests
> -------------
> Tests that didn't complete running successfully are marked with =E2=9A=A1=
=E2=9A=A1=E2=9A=A1.
> If this was caused by an infrastructure issue, we try to mark that
> explicitly in the report.
>
> Waived tests
> ------------
> If the test run included waived tests, they are marked with =F0=9F=9A=A7.=
 Such tests are
> executed but their results are not taken into account. Tests are waived w=
hen
> their results are not reliable enough, e.g. when they're just introduced =
or are
> being fixed.
>
> Testing timeout
> ---------------
> We aim to provide a report within reasonable timeframe. Tests that haven'=
t
> finished running yet are marked with =E2=8F=B1.
> Targeted tests
> --------------
> Test runs for patches always include a set of base tests, plus some
> tests chosen based on the file paths modified by the patch. The latter
> are called "targeted tests". If no targeted tests are run, that means
> no patch-specific tests are available. Please, consider contributing a
> targeted test for related patches to increase test coverage. See
> https://docs.engineering.redhat.com/x/_wEZB for more details.
>

