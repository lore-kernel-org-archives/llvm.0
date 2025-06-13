Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D327427146C
	for <llvm@lists.linux.dev>; Fri, 13 Jun 2025 21:12:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749849130; cv=none; b=ci2euBCPmyzVQsl+2KtXmEW+54n0CIULBxeiW03CpKy9SX2Uq4NI3RKb/jJIHtJHp/ChIFXcACzV/trzgWhAok7D3rd8QCPg1XUvu3rAZ9GsFj5+gEloSqAIutvcWcAbI9oa2fRpjieoOz/1gYcBGB7jR+hWOR32DEoPOWVGJvw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749849130; c=relaxed/simple;
	bh=6bBbQi17WxI6B/SUvtSP3as3uMDB2CJSafLrrx62atk=;
	h=From:Subject:Date:To:MIME-Version:Message-Id:Content-Type; b=aq2Va/mXpyyA/zuSXSUYfa/Wpy6tHRUYkjfIL/Rx1hGButEWU84mKm7WMSoKgUxZKxhpF3nyX61SRRRqjT7GS0iqqKPU/lPupJVvu4ONsWjCYOzpbuTO9EcC+8vI68ZuV0INVAud2VaPUmhuIygFuioly9WQj0aOpnzdkdkEj84=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=QOC0v3Zm; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="QOC0v3Zm"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1749849127;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=GxOHlTlQXuggcrL8auyDiKvO47V6JF9ZP9syPNUUZi4=;
	b=QOC0v3ZmB6JR1F06/AQRhLfHqFM/PjlHmvfU5VftaVKqPGZ6j+0LY1gHnfXH8SRZhfISuL
	mypMcpfdaTYAD9p1oGMWVfy2W/FJtFvuGMLN4K259Ts1yeQBgEGIAiXDuaLAQQj9HAscFn
	VMD7g6oIEw0qOAM7LcBwa3ALY+4p5r8=
Received: from mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-171-9tO6PW5sODSCOV0AvUCbqg-1; Fri,
 13 Jun 2025 17:12:06 -0400
X-MC-Unique: 9tO6PW5sODSCOV0AvUCbqg-1
X-Mimecast-MFC-AGG-ID: 9tO6PW5sODSCOV0AvUCbqg_1749849125
Received: from mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 7152419560AA
	for <llvm@lists.linux.dev>; Fri, 13 Jun 2025 21:12:05 +0000 (UTC)
Received: from [172.20.188.120] (unknown [10.30.45.122])
	by mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 06A2B30044D1;
	Fri, 13 Jun 2025 21:12:04 +0000 (UTC)
From: cki-project@redhat.com
Subject: =?utf-8?b?4p2M?= FAIL (MISSED 62 of 79): Test report for master
 (6.16.0-rc1, upstream-mainline, aef17cb3)
Date: Fri, 13 Jun 2025 21:12:04 -0000
To: llvm@lists.linux.dev
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.4
Message-Id: <16545.125061317120600697@us-mta-171.us.mimecast.lan>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: eAZnNoMexeIImAu34Q2ytnHsd1aZhCs3K957j2E_TOY_1749849125
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hi, we tested your kernel and here are the results:

    Overall result: FAILED
             Merge: OK
           Compile: OK
              Test: FAILED (Did not boot)


Kernel information:
    Commit message: Revert "mm/damon/Kconfig: enable CONFIG_DAMON by defaul=
t"

You can find all the details about the test run at
    https://datawarehouse.cki-project.org/kcidb/checkouts/redhat:1863268729

One or more kernel builds failed:
    Builds that are failing to boot:
          x86_64 (debug) - https://datawarehouse.cki-project.org/kcidb/buil=
ds/redhat:1863268729-x86_64-kernel-debug

Tests that were not ran because of internal issues:
    Boot test [aarch64, ppc64le, s390x, x86_64]
    CKI/restraint [aarch64, ppc64le, s390x, x86_64]
    kselftests upstream - bpf [x86_64]
    kselftests upstream - bpf_test_progs [x86_64]
    kselftests upstream - net [x86_64]
    machineinfo [aarch64, ppc64le, s390x, x86_64]
    Reboot test [aarch64, ppc64le, s390x, x86_64]
    SELinux Custom Module Setup [aarch64, ppc64le, s390x, x86_64]
    selinux-policy: serge-testsuite [aarch64, ppc64le, s390x, x86_64]
    Storage - blktests - throtl [s390x, x86_64]
    Storage - blktests - ublk [s390x, x86_64]
    stress: stress-ng - cpu-cache [s390x, x86_64]
    stress: stress-ng - memory [s390x, x86_64]
    xfstests - btrfs [x86_64]
    xfstests - cifsv3.11 [x86_64]
    xfstests - ext4 [x86_64]
    xfstests - nfsv4.2 [x86_64]
    xfstests - xfs [x86_64]


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

