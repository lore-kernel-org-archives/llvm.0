Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B83717C4
	for <llvm@lists.linux.dev>; Wed, 16 Aug 2023 05:10:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1692162616;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=hFuF5NK6LnH63xNXVH3MAkLra9j+8nOqCilO3CnswQ4=;
	b=bnMU80Hl31BkbcHsdLEuw+5iZtXlZ+U3mTgvvxT0MiQPI+7WNmuuLZNDLqei2SQZiW9Fyi
	JDS+YXnx61bugcDuOOtkepeP9GH4mbcPiRQXKYsLboTXw0qHlBc56ys/vAX+GNtqDPWC2G
	o9ds8VwmGfeiQQG/U5gPweMbJYCrjb4=
Received: from mimecast-mx02.redhat.com (66.187.233.73 [66.187.233.73]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-28-1-FKR7fIPeqUB7X-VsWG7w-1; Wed, 16 Aug 2023 01:10:15 -0400
X-MC-Unique: 1-FKR7fIPeqUB7X-VsWG7w-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com [10.11.54.2])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id C46511C05ED1
	for <llvm@lists.linux.dev>; Wed, 16 Aug 2023 05:10:14 +0000 (UTC)
Received: from [172.64.0.120] (unknown [10.30.33.131])
	by smtp.corp.redhat.com (Postfix) with ESMTP id AC17740D283A;
	Wed, 16 Aug 2023 05:10:14 +0000 (UTC)
From: cki-project@redhat.com
Subject: =?utf-8?b?4p2M?= FAIL (SKIPPED 19 of 267): Test report for master
 (6.5.0-rc6, mainline.kernel.org-clang, d4f8e13b)
Date: Wed, 16 Aug 2023 05:10:14 -0000
To: yizhan@redhat.com, llvm@lists.linux.dev
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
Message-Id: <07577.123081601101500185@us-mta-28.us.mimecast.lan>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hi, we tested your kernel and here are the results:

    Overall result: FAILED
             Merge: OK
           Compile: OK
              Test: FAILED


Kernel information:
    Commit message: Merge tag 'regulator-fix-v6.5-rc6' of git://git.kernel.=
org/pub/scm/linux/kernel/git/broonie/regulator

You can find all the details about the test run at
    https://datawarehouse.cki-project.org/kcidb/checkouts/100182

One or more kernel tests failed:
    Unrecognized or new issues:
           s390x - Storage - blktests - blk
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
9166108
                   Non-passing subtests:
                       =E2=9D=8C FAIL storage/blktests/tests/nvme/002
                       =E2=9D=8C FAIL storage/blktests/tests/nvme/016
                       =E2=9D=8C FAIL storage/blktests/tests/nvme/017
                       =E2=9D=8C FAIL storage/blktests/tests/nvme/030
           s390x - Storage - blktests - nvme-tcp
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
9166109
                   Non-passing subtests:
                       =E2=9D=8C FAIL nvme-tcp: storage/blktests/nvme/nvme-=
tcp/tests/nvme/030

    We also see the following known issues which are not related to your ch=
anges:
        Issue: Internal Network Outage
            URL: https://docs.cki-project.org/failures/#internal-network-ou=
tage
            Affected tests:
                  x86_64 - Boot test
                  x86_64 (debug) - Boot test
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
        Issue: kdump - kexec_boot: image_arm64_probe: Bad arm64 image heade=
r
            URL: https://issues.redhat.com/browse/RHELPLAN-138156
            Affected tests:
                 aarch64 - kdump - kexec_boot
                 aarch64 - kdump - kexec-file-load
        Issue: Firmware test suite: mv: cannot stat 'dtcompilerparser.tab.c=
': No such file or directory
            URL: https://gitlab.com/redhat/centos-stream/tests/kernel/kerne=
l-tests/-/issues/1544
            Affected tests:
                 aarch64 - Hardware - Firmware test suite
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
        Issue: [upstream] Libkcapi AF_ALG test: Oops in gcm_walk_start/gcm_=
aes_crypt on s390x
            URL: https://linux-regtracking.leemhuis.info/regzbot/regression=
/lore/CAAUqJDuRkHE8fPgZJGaKjUjd3QfGwzfumuJBmStPqBhubxyk_A@mail.gmail.com/
            Affected tests:
                   s390x - Libkcapi AF_ALG test
        Issue: Storage - blktests - nvme-tcp: nvme/013 (run mkfs and data v=
erification fio job on NVMeOF file-backed ns) get stuck
            URL: https://gitlab.com/redhat/centos-stream/tests/kernel/kerne=
l-tests/-/issues/1398
            Affected tests:
                  x86_64 - Storage - blktests - blk
                  x86_64 - Storage - blktests - nvme-tcp
        Issue: Storage - blktests - nvme-tcp: hit test timeout
            URL: https://datawarehouse.cki-project.org/kcidb/tests/7523235
            Affected tests:
                  x86_64 - Storage - blktests - nvme-tcp
        Issue: avc:  denied  { name_bind } for  pid=3D897864 comm=3D"rpcbin=
d" src=3D63924 scontext=3Dsystem_u:system_r:rpcbind_t:s0 tcontext=3Dsystem_=
u:object_r:unreserved_port_t:s0 tclass=3Dudp_socket permissive=3D1
            URL: https://bugzilla.redhat.com/show_bug.cgi?id=3D1983604#c3
            Affected tests:
                  x86_64 - xfstests - nfsv4.2



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

