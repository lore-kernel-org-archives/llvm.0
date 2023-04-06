Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9317D6FD0
	for <llvm@lists.linux.dev>; Thu,  6 Apr 2023 13:32:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1680787936;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=SasBf2rvWM3dg/vi/aHoGf+GAr4DymaUwKCQF4tAkUQ=;
	b=KmEdbx58u1uC+KQgD61cwVZP4FfYGZD1CpM7KHRZKwR4UICQ1h2jht9LR68GOfUj0hXGiT
	ntk+8mlPdp7Qld0Pv/hL/nMea6TEJVGjQi4iwJFYPVpuigky62kCoWrOD8DeFym97qzwzc
	T3QcZsF1/d8zoVzi3sBBYcRjonfTtVU=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-512-ZRaOq1iNOjy_FjaJhvy5-g-1; Thu, 06 Apr 2023 09:32:14 -0400
X-MC-Unique: ZRaOq1iNOjy_FjaJhvy5-g-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com [10.11.54.9])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 8F53D3801FE6
	for <llvm@lists.linux.dev>; Thu,  6 Apr 2023 13:32:14 +0000 (UTC)
Received: from [172.64.0.121] (unknown [10.30.32.245])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 795FD492C14;
	Thu,  6 Apr 2023 13:32:14 +0000 (UTC)
From: cki-project@redhat.com
Subject: =?utf-8?b?4p2M?= FAIL (SKIPPED 47 of 358): Test report for master
 (6.3.0-rc5, mainline.kernel.org-clang, 99ddf225)
Date: Thu, 06 Apr 2023 13:32:14 -0000
To: llvm@lists.linux.dev, omosnace@redhat.com, mmalik@redhat.com
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.9
Message-Id: <88704.123040609321402147@us-mta-512.us.mimecast.lan>
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
    Commit message: Merge tag 'trace-v6.3-rc5' of git://git.kernel.org/pub/=
scm/linux/kernel/git/trace/linux-trace

You can find all the details about the test run at
    https://datawarehouse.cki-project.org/kcidb/checkouts/83729

One or more kernel tests failed:
    Unrecognized or new issues:
         aarch64 - selinux-policy: serge-testsuite
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
7719207
         ppc64le - selinux-policy: serge-testsuite
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
7719051
           s390x - selinux-policy: serge-testsuite
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
7718907
          x86_64 - selinux-policy: serge-testsuite
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
7718991

    We also see the following known issues which are not related to your ch=
anges:
        Issue: Internal Network Outage
            URL: https://docs.cki-project.org/failures/#internal-network-ou=
tage
            Affected tests:
                  x86_64 (debug) - Boot test
        Issue: avc:  denied  { name_bind } for  pid=3D897864 comm=3D"rpcbin=
d" src=3D63924 scontext=3Dsystem_u:system_r:rpcbind_t:s0 tcontext=3Dsystem_=
u:object_r:unreserved_port_t:s0 tclass=3Dudp_socket permissive=3D1
            URL: https://bugzilla.redhat.com/show_bug.cgi?id=3D1983604#c3
            Affected tests:
                  x86_64 - xfstests - nfsv4.2
        Issue: Storage blktests - blk: scsi/007: Reading from scsi_debug fa=
iled
            URL: https://bugzilla.redhat.com/show_bug.cgi?id=3D2027550
            Affected tests:
                 aarch64 - Storage - blktests - blk
                   s390x - Storage - blktests - blk
        Issue: kdump - kexec_boot: image_arm64_probe: Bad arm64 image heade=
r
            URL: https://gitlab.com/redhat/centos-stream/tests/kernel/kerne=
l-tests/-/issues/1580
            Affected tests:
                 aarch64 - kdump - kexec_boot
                 aarch64 - kdump - kexec-file-load
        Issue: Firmware test suite: modinfo: ERROR: Module efi_runtime not =
found
            URL: https://gitlab.com/redhat/centos-stream/tests/kernel/kerne=
l-tests/-/issues/1235
            Affected tests:
                 aarch64 - Firmware test suite
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

