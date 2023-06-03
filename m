Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54351257B
	for <llvm@lists.linux.dev>; Sat,  3 Jun 2023 08:11:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1685779866;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=BgmAoS1e/N0fHNZVKhd9OnTGFkAQvXWzWtNB5CF/KUw=;
	b=DUW7prEtn7lwHfjlrfmO0vwPjxieHWCMhfqsgjnhFzfpdRapBCU7IaV8VS+vAiaOJCrhx9
	sQZLTmijp8/1sD8V1IdOtNosTsu6C5bcLS67vm+jt+H245/fNdPJTDTeIK2PeM+VaJ1BPW
	6fsaq4p15faX9OO2qx1vXYBT68OnPww=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-487-Azg8R7acODeaBdRlw6iC4A-1; Sat, 03 Jun 2023 04:11:05 -0400
X-MC-Unique: Azg8R7acODeaBdRlw6iC4A-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com [10.11.54.8])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 1E0C43806721
	for <llvm@lists.linux.dev>; Sat,  3 Jun 2023 08:11:05 +0000 (UTC)
Received: from [172.64.2.80] (unknown [10.30.34.88])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 006ACC0448E;
	Sat,  3 Jun 2023 08:11:04 +0000 (UTC)
From: cki-project@redhat.com
Subject: =?utf-8?b?4p2M?= FAIL (SKIPPED 43 of 346): Test report for master
 (6.4.0-rc4, mainline.kernel.org-clang, c43a6ff9)
Date: Sat, 03 Jun 2023 08:11:04 -0000
To: czhong@redhat.com, llvm@lists.linux.dev, bgoncalv@redhat.com
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8
Message-Id: <38845.123060304110500253@us-mta-487.us.mimecast.lan>
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
    Commit message: Merge tag 'modules-6.4-rc5-second-pull' of git://git.ke=
rnel.org/pub/scm/linux/kernel/git/mcgrof/linux

You can find all the details about the test run at
    https://datawarehouse.cki-project.org/kcidb/checkouts/91097

One or more kernel tests failed:
    =E2=9D=97 Regression(s) detected:
         aarch64 - Storage - multipath mapping test
                   Issue: Storage - multipath mapping test: FAIL: ls: canno=
t access '/dev/mapper/mpath*': No such file or directory
                          https://gitlab.com/redhat/centos-stream/tests/ker=
nel/kernel-tests/-/issues/1617
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
8353658

    Note: Any of these might not be a regression and/or we might have mista=
kenly thought this issue to be fixed.
          If it is not a regression, please ask the test maintainer to reop=
en the issue and untag the regression from this execution.

    Unrecognized or new issues:
          x86_64 (debug) - Boot test
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
8353846

    We also see the following known issues which are not related to your ch=
anges:
        Issue: (ppc64le) selinux-policy: serge-testsuite: ld: cannot find a=
rch/powerpc/lib/crtsavres.o: No such file or directory
            URL: https://gitlab.com/redhat/centos-stream/tests/kernel/kerne=
l-tests/-/issues/1267
            Affected tests:
                 ppc64le - selinux-policy: serge-testsuite
        Issue: Aborting task xxxx from recipe xxxx as system expects to run=
 tests for recipe xxxx
            URL: https://gitlab.com/cki-project/upt/-/issues/99
            Affected tests:
                 aarch64 - SELinux Custom Module Setup
                 aarch64 - machineinfo
                 aarch64 - Boot test
                 aarch64 - IPMI driver test
                 aarch64 - IPMItool loop stress test
                 aarch64 - Storage - blktests - blk
                 aarch64 - Storage - blktests - nvme-tcp
                 aarch64 - Storage - block - filesystem fio test
                 aarch64 - Storage - block - queue scheduler test
                 aarch64 - Storage - swraid scsi_raid
                 aarch64 - stress: stress-ng - cpu-cache
                 aarch64 - stress: stress-ng - memory
                 aarch64 - Reboot test
                  x86_64 - kdump - kexec-file-load
                  x86_64 - kselftests upstream - net
                  x86_64 - kselftests upstream - bpf
                  x86_64 - kselftests upstream - bpf_test_progs
                  x86_64 - Reboot test
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
        Issue: avc:  denied  { name_bind } for  pid=3D897864 comm=3D"rpcbin=
d" src=3D63924 scontext=3Dsystem_u:system_r:rpcbind_t:s0 tcontext=3Dsystem_=
u:object_r:unreserved_port_t:s0 tclass=3Dudp_socket permissive=3D1
            URL: https://bugzilla.redhat.com/show_bug.cgi?id=3D1983604#c3
            Affected tests:
                  x86_64 - xfstests - nfsv4.2
        Issue: Libkcapi AF_ALG test: hit test timeout, aborting it...
            URL: https://gitlab.com/redhat/centos-stream/tests/kernel/kerne=
l-tests/-/issues/1637
            Affected tests:
                  x86_64 (debug) - Libkcapi AF_ALG test
        Issue: Libkcapi AF_ALG test: alg: timeout due to an unusually slow =
machine
            URL: https://gitlab.com/redhat/centos-stream/tests/kernel/kerne=
l-tests/-/issues/1395
            Affected tests:
                  x86_64 (debug) - Libkcapi AF_ALG test
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

