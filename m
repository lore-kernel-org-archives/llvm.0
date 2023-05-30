Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72B76636
	for <llvm@lists.linux.dev>; Tue, 30 May 2023 00:51:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1685407868;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=GrGdeI9PKBVjg0m1h5Aed9C48snML5clXDfeamIaejI=;
	b=IrKU/oc7h6YCFHnT0xqn+BSG9RdYi/HzEWZjmpeFqpxHyPdr7IY3ZS4tsZn5VsN0h3pLRG
	ROm7ajECYTUT+9rv/CVlcv+OYNAZTGDNsfaMX4ygP39zX+Kfz9eqtSH0uvXQv99/DDQpEV
	JWu0kOBVpSFtZovEylQGA2e/hROiEsQ=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-601-sVKEk-KWOUWmcmobEjMoRQ-1; Mon, 29 May 2023 20:51:06 -0400
X-MC-Unique: sVKEk-KWOUWmcmobEjMoRQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com [10.11.54.6])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 9297580120A
	for <llvm@lists.linux.dev>; Tue, 30 May 2023 00:51:06 +0000 (UTC)
Received: from [172.64.2.80] (unknown [10.30.34.88])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 712632166B2B;
	Tue, 30 May 2023 00:51:06 +0000 (UTC)
From: cki-project@redhat.com
Subject: =?utf-8?b?4pyF?= PASS (SKIPPED 6 of 346): Test report for master
 (6.4.0-rc4, mainline.kernel.org-clang, ac2263b5)
Date: Tue, 30 May 2023 00:51:06 -0000
To: llvm@lists.linux.dev
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6
Message-Id: <10349.123052920510600161@us-mta-601.us.mimecast.lan>
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
    Commit message: Revert "module: error out early on concurrent load of t=
he same module file"

You can find all the details about the test run at
    https://datawarehouse.cki-project.org/kcidb/checkouts/90637

One or more kernel tests failed:
    We also see the following known issues which are not related to your ch=
anges:
        Issue: Storage - blktests - nvmeof-mp: nvmeof-mp/012: Timed out for=
 waiting the udev queue being empty
            URL: https://gitlab.com/redhat/centos-stream/tests/kernel/kerne=
l-tests/-/issues/1470
            Affected tests:
                 aarch64 - Storage - blktests - nvmeof-mp
                  x86_64 - Storage - blktests - nvmeof-mp
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
        Issue: [upstream][s390x] NETDEV WATCHDOG: ens5953 (mlx5_core): tran=
smit queue 1 timed out -  WARNING: CPU: 0 PID: 0 at net/sched/sch_generic.c=
:526 dev_watchdog+0x3fa/0x440
            URL: https://datawarehouse.cki-project.org/kcidb/tests/8310534
            Affected tests:
                   s390x - Boot test
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
        Issue: Storage blktests - nvmeof-mp: Timeout
            URL: https://bugzilla.redhat.com/show_bug.cgi?id=3D2014813
            Affected tests:
                 aarch64 - Storage - blktests - nvmeof-mp
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
                 aarch64 - Firmware test suite



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

