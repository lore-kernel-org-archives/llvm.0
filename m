Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 321614408
	for <llvm@lists.linux.dev>; Tue, 25 Apr 2023 15:01:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1682434894;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=83v1mCfrIpx4em/Xi/h8ZrL4Pip1hN0NsRikgKgl3Yk=;
	b=UgpXfC+YA10exTUwwtip0i97THMcSPvnKtKmpVoNC5f0HSDckWU35CexTA13ORnrRb464u
	1Rymo2lJvLK7tJW2JE9ll7wXHKO+75/XEr6uAF43A8yfSSpxp72me2u5Pi6H12Xv1jrnEt
	71rYcyyCKv2mceq+59JcbzTV3t0W9qU=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-556-CWILjzUjP06GJt_Qlc-F3A-1; Tue, 25 Apr 2023 11:01:32 -0400
X-MC-Unique: CWILjzUjP06GJt_Qlc-F3A-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com [10.11.54.9])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id CB785382C971
	for <llvm@lists.linux.dev>; Tue, 25 Apr 2023 15:01:31 +0000 (UTC)
Received: from [172.64.2.76] (unknown [10.30.34.88])
	by smtp.corp.redhat.com (Postfix) with ESMTP id A7263492C18;
	Tue, 25 Apr 2023 15:01:31 +0000 (UTC)
From: cki-project@redhat.com
Subject: =?utf-8?b?4pyF?= PASS (SKIPPED 28 of 353): Test report for master
 (6.3.0, mainline.kernel.org-clang, 61d325dc)
Date: Tue, 25 Apr 2023 15:01:31 -0000
To: llvm@lists.linux.dev
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.9
Message-Id: <36531.123042511013200336@us-mta-556.us.mimecast.lan>
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
    Commit message: Merge tag 'erofs-for-6.4-rc1' of git://git.kernel.org/p=
ub/scm/linux/kernel/git/xiang/erofs

You can find all the details about the test run at
    https://datawarehouse.cki-project.org/kcidb/checkouts/85858

One or more kernel tests failed:
    We also see the following known issues which are not related to your ch=
anges:
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
        Issue: kdump - sysrq-c: kdump: Reserved 0MB memory for crash kernel
            URL: https://datawarehouse.cki-project.org/kcidb/tests/7188004
            Affected tests:
                   s390x - kdump - sysrq-c
        Issue: (ppc64le) selinux-policy: serge-testsuite: ld: cannot find a=
rch/powerpc/lib/crtsavres.o: No such file or directory
            URL: https://gitlab.com/redhat/centos-stream/tests/kernel/kerne=
l-tests/-/issues/1267
            Affected tests:
                 ppc64le - selinux-policy: serge-testsuite
        Issue: kdump - kexec_boot: image_arm64_probe: Bad arm64 image heade=
r
            URL: https://gitlab.com/redhat/centos-stream/tests/kernel/kerne=
l-tests/-/issues/1580
            Affected tests:
                 aarch64 - kdump - kexec_boot
                 aarch64 - kdump - kexec-file-load
        Issue: Firmware test suite: mv: cannot stat 'dtcompilerparser.tab.c=
': No such file or directory
            URL: https://gitlab.com/redhat/centos-stream/tests/kernel/kerne=
l-tests/-/issues/1544
            Affected tests:
                 aarch64 - Firmware test suite
        Issue: Firmware test suite: cannot stat 'dtcompilerparser.tab.c': N=
o such file or directory
            URL: https://gitlab.com/redhat/centos-stream/tests/kernel/kerne=
l-tests/-/issues/1611
            Affected tests:
                 aarch64 - Firmware test suite
        Issue: xfstests - _check_xfs_filesystem: filesystem on /dev/nvme0n1=
p4 is inconsistent (r)
            URL: https://bugzilla.redhat.com/show_bug.cgi?id=3D1989409
            Affected tests:
                 aarch64 - xfstests - btrfs



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

