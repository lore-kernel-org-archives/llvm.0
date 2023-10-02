Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E3A71F92E
	for <llvm@lists.linux.dev>; Mon,  2 Oct 2023 19:50:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1696276225;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=MLAXrZYG8ZSgN6wj4D8ASg3hK1uBtf5SHlVcaR+cpLA=;
	b=RsUvg4H+kixOLbKa1a2I8ZBuoB7eES9QaVRkRVFkASY6ykjdvLSvhuIZq51JmjGzpI2WFN
	++fl2DBIN+iMp720MaRjVdMY3vND/cxz+5ToScOkSBP794X23ZADpDcCIoHThw4ce9cVSf
	ZnnjH6W4BCr/eNM/Hd2c1tYEWq5rjMo=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-10-vrl4pEnNM2WfSElHbE0haA-1; Mon, 02 Oct 2023 15:50:23 -0400
X-MC-Unique: vrl4pEnNM2WfSElHbE0haA-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com [10.11.54.6])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id D13A78015AB
	for <llvm@lists.linux.dev>; Mon,  2 Oct 2023 19:50:22 +0000 (UTC)
Received: from [172.64.10.35] (unknown [10.30.34.11])
	by smtp.corp.redhat.com (Postfix) with ESMTP id BD5E32156701;
	Mon,  2 Oct 2023 19:50:22 +0000 (UTC)
From: cki-project@redhat.com
Subject: =?utf-8?b?4pyF?= PASS (SKIPPED 18 of 230): Test report for master
 (6.6.0-rc4, mainline.kernel.org-clang, 8a749fd1)
Date: Mon, 02 Oct 2023 19:50:22 -0000
To: llvm@lists.linux.dev
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6
Message-Id: <35600.123100215502300711@us-mta-10.us.mimecast.lan>
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
    Commit message: Linux 6.6-rc4

You can find all the details about the test run at
    https://datawarehouse.cki-project.org/kcidb/checkouts/106979

One or more kernel tests failed:
    We also see the following known issues which are not related to your ch=
anges:
        Issue: xfstests: generic/354 file exists
            URL: https://gitlab.com/redhat/centos-stream/tests/kernel/kerne=
l-tests/-/issues/1654
            Affected tests:
                  x86_64 - xfstests - nfsv4.2
                  x86_64 - xfstests - cifsv3.11
                  x86_64 (debug) - xfstests - nfsv4.2
                  x86_64 (debug) - xfstests - cifsv3.11
        Issue: kdump - kexec_boot: image_arm64_probe: Bad arm64 image heade=
r
            URL: https://issues.redhat.com/browse/RHELPLAN-138156
            Affected tests:
                 aarch64 - kdump - kexec_boot
        Issue: [RHEL9][aarch64] kdump - kexec_load(): can't determine the f=
ile type of kdump kernel
            URL: https://issues.redhat.com/browse/RHEL-9434
            Affected tests:
                 aarch64 - kdump - sysrq-c
        Issue: [rawhide] kdump - sysrq-c: kdump: kexec: failed to load kdum=
p kernel
            URL: https://bugzilla.redhat.com/show_bug.cgi?id=3D2052949#c1
            Affected tests:
                 aarch64 - kdump - sysrq-c
        Issue: Firmware test suite: mv: cannot stat 'dtcompilerparser.tab.c=
': No such file or directory
            URL: https://gitlab.com/redhat/centos-stream/tests/kernel/kerne=
l-tests/-/issues/1544
            Affected tests:
                 aarch64 - Hardware - Firmware test suite
        Issue: kselftest build - bpf: progs/test_bpf_nf.c:160:42: error: us=
e of undeclared identifier 'NF_NAT_MANIP_SRC'
            URL: https://gitlab.com/redhat/centos-stream/tests/kernel/kerne=
l-tests/-/issues/1418
            Affected tests:
                  x86_64 (debug) - kselftests upstream - bpf
                  x86_64 (debug) - kselftests upstream - bpf_test_progs
        Issue: (ppc64le) selinux-policy: serge-testsuite: ld: cannot find a=
rch/powerpc/lib/crtsavres.o: No such file or directory
            URL: https://gitlab.com/redhat/centos-stream/tests/kernel/kerne=
l-tests/-/issues/1267
            Affected tests:
                 ppc64le - selinux-policy: serge-testsuite



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

