Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53C342119
	for <llvm@lists.linux.dev>; Tue,  6 Jun 2023 06:10:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1686031809;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=7xLVlredGFBm8dE84HX7G8qb2y8/OyU2eivSfWBMLmE=;
	b=AmL7priN3U7Bjn56U80V20ZPeJ2ZubfPlarkWUrQhDaYlMwpMqKhRBL7i61ygto0h8VL38
	zDgZVpRzz6TnBlmUR+IDbFwzDka/gumMBOCzRsAvU1LOyPNV07QO8oTMF0xdGAzidkgIxR
	7eoYUrcoMa7bnwCmnRvQUH1uevYjtDc=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-42-_PxJKiTDOrWC3BnpdW-_sw-1; Tue, 06 Jun 2023 02:10:07 -0400
X-MC-Unique: _PxJKiTDOrWC3BnpdW-_sw-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com [10.11.54.3])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id ABDB685A5B5
	for <llvm@lists.linux.dev>; Tue,  6 Jun 2023 06:10:07 +0000 (UTC)
Received: from [172.64.4.83] (unknown [10.30.32.45])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 99C6B1121314;
	Tue,  6 Jun 2023 06:10:07 +0000 (UTC)
From: cki-project@redhat.com
Subject: =?utf-8?b?4pyF?= PASS (SKIPPED 28 of 346): Test report for master
 (6.4.0-rc5, mainline.kernel.org-clang, f8dba31b)
Date: Tue, 06 Jun 2023 06:10:07 -0000
To: llvm@lists.linux.dev
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.3
Message-Id: <30214.123060602100800115@us-mta-42.us.mimecast.lan>
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
    Commit message: Merge tag 'asym-keys-fix-for-linus-v6.4-rc5' of https:/=
/github.com/robertosassu/linux

You can find all the details about the test run at
    https://datawarehouse.cki-project.org/kcidb/checkouts/91353

One or more kernel tests failed:
    We also see the following known issues which are not related to your ch=
anges:
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
        Issue: Aborting task xxxx from recipe xxxx as system expects to run=
 tests for recipe xxxx
            URL: https://gitlab.com/cki-project/upt/-/issues/99
            Affected tests:
                   s390x - Boot test
                   s390x - kdump - sysrq-c
                   s390x - kdump - file-load
                   s390x - Reboot test
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

