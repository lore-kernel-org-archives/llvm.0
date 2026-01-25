Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 487F425776
	for <llvm@lists.linux.dev>; Sun, 25 Jan 2026 02:52:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769309537; cv=none; b=ciqIT69yRWmgKJWSbsaltyEtg0wQY03GSO+qlVq8yCD2w1iIgathWY1y1Xs3oM93i8RLNoc2vgaHRKGe8tVL2yBxUqSgCJQS0fy8iI0WL0D7cCwMvy4QI/7ft/UXem8tUywGihJx1ZkIvU/DKnZXzZF4IHlb/JOISFBkEruoQKw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769309537; c=relaxed/simple;
	bh=fqnzhmxXmK4k7PeUdMFoSSshVgcUfN8QXJcdb8IlDcI=;
	h=From:Subject:Date:To:MIME-Version:Message-Id:Content-Type; b=MAD/XdjAPMzSVyr4lyQlCv9szIzAEcCFZt37xncT2PzAZ8lVhFj/WKHTSDHlQ1Cemy6Uoz4d6n/kaqwAWoltgpIvDND1RHPkEAZVgwANgVu699s5OxcZptNoI94hNp274H9gUhwACiPVnZF8z7qoxO4g/jCII8kYc/9TEH+fVoo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=gkkPbdD0; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="gkkPbdD0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1769309535;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=aQSBV21cVBN3D8hZZEUY7CpDkP2AqSs0J6NNXLCfAKQ=;
	b=gkkPbdD040eaWDctv2Ej7APGRhmE4yCMky5sukZq0j3Yoze92Qc8PSmYZD4TEKeK07tY6U
	lDoE9yHao7SJdpTqiXvBMOQSnDIA7VwT+LKalUZerWBuwLKd1sAn4+DDbGkxkAagdMh4Qd
	wVdZ5UeYI3HmMSVg1madfp+VtPmPU1c=
Received: from mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-226-i-o--HLwMJmM0Wg5VI7N8w-1; Sat,
 24 Jan 2026 21:52:14 -0500
X-MC-Unique: i-o--HLwMJmM0Wg5VI7N8w-1
X-Mimecast-MFC-AGG-ID: i-o--HLwMJmM0Wg5VI7N8w_1769309533
Received: from mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.17])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id F07C11956054
	for <llvm@lists.linux.dev>; Sun, 25 Jan 2026 02:52:12 +0000 (UTC)
Received: from [172.20.12.215] (unknown [10.30.44.139])
	by mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 6744A1956095;
	Sun, 25 Jan 2026 02:52:12 +0000 (UTC)
From: cki-project@redhat.com
Subject: =?utf-8?b?4p2M?= FAIL: Test report for master (6.19.0-rc6,
 upstream-mainline, 12a00948)
Date: Sun, 25 Jan 2026 02:52:12 -0000
To: ftjahjad@redhat.com, yoyang@redhat.com, bgoncalv@redhat.com,
 llvm@lists.linux.dev
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.17
Message-Id: <01443.126012421521400185@us-mta-226.us.mimecast.lan>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: AHU8AKAyRoWe4jjJ0HbzHpKHgfwm0-4AP4QiRkYYPP4_1769309533
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hi, we tested your kernel and here are the results:

    Overall result: FAILED
             Merge: OK
           Compile: OK
              Test: FAILED


Kernel information:
    Commit message: Merge tag 'timers-urgent-2026-01-24' of git://git.kerne=
l.org/pub/scm/linux/kernel/git/tip/tip

You can find all the details about the test run at
    https://datawarehouse.cki-project.org/kcidb/checkouts/redhat:2284320394

One or more kernel tests failed:
    Unrecognized or new issues:
        Boot test
              x86_64
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
redhat:2284320394_x86_64_kernel-debug_kcidb_tool_20518383_6
                   Non-passing ran subtests:
                       =E2=9D=8C FAIL distribution/kpkginstall/journalctl-c=
heck
        Reboot test
              x86_64
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
redhat:2284320394_x86_64_kernel-debug_kcidb_tool_20518383_12
                   Non-passing ran subtests:
                       =E2=9D=8C FAIL misc/reboot-test/journalctl-check
        xfstests - nfsv4.2
              x86_64
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
redhat:2284320394_x86_64_kernel_kcidb_tool_20518375_10
                   Non-passing ran subtests:
                       =E2=9D=8C FAIL generic/309
              x86_64
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
redhat:2284320394_x86_64_kernel-debug_kcidb_tool_20518383_10
                   Non-passing ran subtests:
                       =E2=9D=8C FAIL generic/309

    We also see the following known issues which are not related to your ch=
anges:
        Issue: [net] [kselftests upstream] catch all failures
            URL: https://issues.redhat.com/browse/RHELTEST-1362
            Affected tests:
                kselftests upstream - bpf [x86_64, x86_64]
                kselftests upstream - bpf_test_progs [x86_64, x86_64]
                kselftests upstream - net [x86_64, x86_64]
        Issue: (ppc64le) selinux-policy: serge-testsuite: ld: cannot find a=
rch/powerpc/lib/crtsavres.o: No such file or directory
            URL: https://issues.redhat.com/browse/RHELTEST-39
            Affected tests:
                selinux-policy: serge-testsuite [ppc64le]



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

