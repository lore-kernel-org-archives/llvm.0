Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5DB53C37BD
	for <llvm@lists.linux.dev>; Tue, 23 Jun 2026 06:23:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782195791; cv=none; b=gW87KhN5Z/3GEX6wF75lPGa29LnzFq+ZAQOj/BdquPdGzynYUXY6HknTiJNSfpim8NisNucjgYY8bghGu3Ya8DawTUZFf9FONRTCGvS9DKIofmmIleRKT1iLMXoho9NskFP+TL5lAnZFC07eyOSqz0oUq6OA1T2ehbTdP21wVao=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782195791; c=relaxed/simple;
	bh=baNLkqml2ZUsmwCa+B2uOxdiy2bW2YWIAN+KF+oxFAQ=;
	h=From:Subject:Date:To:MIME-Version:Message-Id:Content-Type; b=Hd+uhZGgydJ07Y6SPP549K4JZyDOZtYSLlPGWLBvvMByxKiJiw9aW72LW1MqlLtfb4zJiw0J1rQdVwf2MMgEdGW25G5mHzV44WuHST/fubSYbqgF08354zYOdFn6nTXDTwO0Wi9bPmJnBo29QaDFxaoktYkcg5EopHi3u6uCkwA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=G6vcW4Mv; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="G6vcW4Mv"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1782195786;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=DKOrNX6TLk3KOhBdzMok4sA5cgucivHDTchjcbzLU9E=;
	b=G6vcW4MvZ1HBYvJ/hAW1QLtr5npDDdZ+urqTsRi27qAgvcFCRmTQMdqW6WXsWdDaMHgv5M
	2b3ALtooT1yAN/r81xR3W+MgPvhHU1YT44tqu/fcALrsAbIrx6VKXw6ENvtAIgPKn1OQs/
	Sku4AYXPKkVGtLdzsJ57Vv6rhmmicE0=
Received: from mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-441-iRuDYC01PlKmJfeEJUv4-w-1; Tue,
 23 Jun 2026 02:23:04 -0400
X-MC-Unique: iRuDYC01PlKmJfeEJUv4-w-1
X-Mimecast-MFC-AGG-ID: iRuDYC01PlKmJfeEJUv4-w_1782195783
Received: from mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id AB62B19560AA
	for <llvm@lists.linux.dev>; Tue, 23 Jun 2026 06:23:03 +0000 (UTC)
Received: from [172.20.158.179] (unknown [10.30.44.85])
	by mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id DE1C83001D86;
	Tue, 23 Jun 2026 06:23:02 +0000 (UTC)
From: cki-project@redhat.com
Subject: =?utf-8?b?4p2M?= FAIL: Test report for master (7.1.0-0,
 upstream-mainline, 1dc18801)
Date: Tue, 23 Jun 2026 06:23:02 -0000
To: fs-test@redhat.com, llvm@lists.linux.dev, omosnace@redhat.com,
 mmalik@redhat.com
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.4
Message-Id: <27653.126062302230401738@us-mta-441.us.mimecast.lan>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: sRG0_ZZV_8wgyJkXit7dsHB21P6iUP50nakCibeOewg_1782195783
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hi, we tested your kernel and here are the results:

    Overall result: FAILED
             Merge: OK
           Compile: OK
              Test: FAILED (Did not boot)


Kernel information:
    Commit message: Merge tag 'i2c-7.2-part2' of git://git.kernel.org/pub/s=
cm/linux/kernel/git/andi.shyti/linux

You can find all the details about the test run at
    https://datawarehouse.cki-project.org/kcidb/checkouts/redhat:2620733875

One or more kernel builds failed:
    Builds that are failing to boot:
         ppc64le - https://datawarehouse.cki-project.org/kcidb/builds/redha=
t:2620733875_ppc64le_kernel

One or more kernel tests failed:
    Unrecognized or new issues:
        selinux-policy: serge-testsuite
               s390x
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
redhat:2620733875_s390x_kernel_kcidb_tool_21504680_7
                   Non-passing ran subtests:
                       =E2=9A=A1 ERROR Setup
                       =E2=9D=8C FAIL Test
             aarch64
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
redhat:2620733875_aarch64_kernel_kcidb_tool_21504683_7
                   Non-passing ran subtests:
                       =E2=9A=A1 ERROR Setup
                       =E2=9D=8C FAIL Test
              x86_64
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
redhat:2620733875_x86_64_kernel_kcidb_tool_21504677_7
                   Non-passing ran subtests:
                       =E2=9A=A1 ERROR Setup
                       =E2=9D=8C FAIL Test
        xfstests - btrfs
             aarch64
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
redhat:2620733875_aarch64_kernel_kcidb_tool_21504684_9
                   Non-passing ran subtests:
                       =E2=9D=8C FAIL generic/301
              x86_64
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
redhat:2620733875_x86_64_kernel_kcidb_tool_21505612_9
                   Non-passing ran subtests:
                       =E2=9D=8C FAIL generic/301



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

