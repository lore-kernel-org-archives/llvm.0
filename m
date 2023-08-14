Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FAC115A6
	for <llvm@lists.linux.dev>; Mon, 14 Aug 2023 01:41:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1691977270;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=AhCgWTGKLTwlkePUwKPvsPnIgwT1YRBE5xGEeAHx7Qs=;
	b=U9uMUCIarNv1vhEnneqokvsZmY2EfuxW1d/WxXxaIQY58z1RL48gLnje/s3LsJwEIVQ8Mn
	+v9GBEI643Fq5KYsCtchSNNhrw9OuKy0+yHVRKTCdJFBE0L0MCXbu6RN87DksJ2dFcDsFl
	hWfYTXWzY66WGOcpo5p1SHmzTMOcghI=
Received: from mimecast-mx02.redhat.com (66.187.233.73 [66.187.233.73]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-655-7igaWe_CPm6tNh6tMhG94g-1; Sun, 13 Aug 2023 21:41:09 -0400
X-MC-Unique: 7igaWe_CPm6tNh6tMhG94g-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com [10.11.54.4])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id B12493811F23
	for <llvm@lists.linux.dev>; Mon, 14 Aug 2023 01:41:08 +0000 (UTC)
Received: from [172.64.13.56] (unknown [10.30.32.93])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 9F2342026D68;
	Mon, 14 Aug 2023 01:41:08 +0000 (UTC)
From: cki-project@redhat.com
Subject: =?utf-8?b?4pyF?= PASS (SKIPPED 4 of 267): Test report for master
 (6.5.0-rc5, mainline.kernel.org-clang, 4c75bf7e)
Date: Mon, 14 Aug 2023 01:41:08 -0000
To: llvm@lists.linux.dev
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.4
Message-Id: <27361.123081321410900115@us-mta-655.us.mimecast.lan>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hi, we tested your kernel and here are the results:

    Overall result: PASSED
             Merge: OK
           Compile: OK
              Test: OK

Tested-by: CKI Project <cki-project@redhat.com>

Kernel information:
    Commit message: Merge tag 'kbuild-fixes-v6.5-2' of git://git.kernel.org=
/pub/scm/linux/kernel/git/masahiroy/linux-kbuild

You can find all the details about the test run at
    https://datawarehouse.cki-project.org/kcidb/checkouts/99875

One or more kernel tests failed:
    We also see the following known issues which are not related to your ch=
anges:
        Issue: kdump - kexec_boot: image_arm64_probe: Bad arm64 image heade=
r
            URL: https://issues.redhat.com/browse/RHELPLAN-138156
            Affected tests:
                 aarch64 - kdump - kexec_boot
                 aarch64 - kdump - kexec-file-load
        Issue: kdump - sysrq-c: (panic) dump_backtrace+0xe8/0x140
            URL: https://gitlab.com/redhat/centos-stream/tests/kernel/kerne=
l-tests/-/issues/1561
            Affected tests:
                 aarch64 - kdump - sysrq-c
        Issue: Firmware test suite: mv: cannot stat 'dtcompilerparser.tab.c=
': No such file or directory
            URL: https://gitlab.com/redhat/centos-stream/tests/kernel/kerne=
l-tests/-/issues/1544
            Affected tests:
                 aarch64 - Hardware - Firmware test suite
        Issue: WARNING: CPU: 0 PID: 0 at arch/x86/kernel/alternative.c:558 =
apply_returns+0x1bf/0x210
            URL: https://lore.kernel.org/all/Ys58BxHxoDZ7rfpr@xsang-OptiPle=
x-9020/
            Affected tests:
                  x86_64 - Boot test
                  x86_64 - Reboot test
                  x86_64 (debug) - Boot test
                  x86_64 (debug) - Reboot test
        Issue: kselftests upstream - net: FAIL: Ping received ICMP Packet t=
oo big
            URL: https://gitlab.com/redhat/centos-stream/tests/kernel/kerne=
l-tests/-/issues/1571
            Affected tests:
                  x86_64 (debug) - kselftests upstream - net
        Issue: kselftest build - bpf: progs/test_bpf_nf.c:160:42: error: us=
e of undeclared identifier 'NF_NAT_MANIP_SRC'
            URL: https://gitlab.com/redhat/centos-stream/tests/kernel/kerne=
l-tests/-/issues/1418
            Affected tests:
                  x86_64 (debug) - kselftests upstream - bpf
                  x86_64 (debug) - kselftests upstream - bpf_test_progs
        Issue: avc:  denied  { name_bind } for  pid=3D897864 comm=3D"rpcbin=
d" src=3D63924 scontext=3Dsystem_u:system_r:rpcbind_t:s0 tcontext=3Dsystem_=
u:object_r:unreserved_port_t:s0 tclass=3Dudp_socket permissive=3D1
            URL: https://bugzilla.redhat.com/show_bug.cgi?id=3D1983604#c3
            Affected tests:
                  x86_64 - xfstests - nfsv4.2
                  x86_64 (debug) - xfstests - nfsv4.2
        Issue: Storage - lvm thinp sanity: FAIL: mkfs.xfs -fd noalign /dev/=
mapper/myvg-thinvolume1
            URL: https://gitlab.com/redhat/centos-stream/tests/kernel/kerne=
l-tests/-/issues/1353
            Affected tests:
                 ppc64le - Storage - lvm thinp sanity
        Issue: (ppc64le) selinux-policy: serge-testsuite: ld: cannot find a=
rch/powerpc/lib/crtsavres.o: No such file or directory
            URL: https://gitlab.com/redhat/centos-stream/tests/kernel/kerne=
l-tests/-/issues/1267
            Affected tests:
                 ppc64le - selinux-policy: serge-testsuite
        Issue: Storage blktests - nvme-tcp: nvme/012: TIMEOUT
            URL: https://gitlab.com/redhat/centos-stream/tests/kernel/kerne=
l-tests/-/issues/1188
            Affected tests:
                  x86_64 - Storage - blktests - blk
        Issue: Storage - blktests - nvme-tcp: nvme/013 (run mkfs and data v=
erification fio job on NVMeOF file-backed ns) get stuck
            URL: https://gitlab.com/redhat/centos-stream/tests/kernel/kerne=
l-tests/-/issues/1398
            Affected tests:
                  x86_64 - Storage - blktests - nvme-tcp
        Issue: Storage - blktests - nvme-tcp: hit test timeout
            URL: https://datawarehouse.cki-project.org/kcidb/tests/7523235
            Affected tests:
                  x86_64 - Storage - blktests - nvme-tcp



If you find a failure unrelated to your changes, please ask the test mainta=
iner to review it.
This will prevent the failures from being incorrectly reported in the futur=
e.

Please reply to this email if you have any questions about the tests that w=
e
ran or if you have any suggestions on how to make future tests more effecti=
ve.

        ,-.   ,-.
       ( C ) ( K )  Continuous
        `-',-.`-'   Kernel
          ( I )     Integration
           `-'
___________________________________________________________________________=
___

