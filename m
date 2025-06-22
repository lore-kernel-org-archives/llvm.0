Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CB59A32
	for <llvm@lists.linux.dev>; Sun, 22 Jun 2025 00:03:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750550594; cv=none; b=MbmrgOCHD5ypd3w7ZQ8y1MgH0Ys+mElJAAulWwXoRYhnss89XSQBdN3vMbaVgxQs0M2F66+aNgS9Si3trRewsVC7sWi3x9obbsO38aUF1+w8jPEFFOjpaMrk882KXDOGLBqT21V3NG6UBC68610VnqqeEbtrt15B2j7bK/MXe1s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750550594; c=relaxed/simple;
	bh=/3HuQzX5+Wag9D0HIrfDmj49WQ6HRrIXuhIwRP6kEFc=;
	h=From:Subject:Date:To:MIME-Version:Message-Id:Content-Type; b=LXdBbgu5mAwX3Hfb3zBM3ARoPcXRZKe9HeuoUmogy/N32AohhgFTDU/vyd6+r5LjRht20jwbqSbyjlGGjMmlAsHfjzrzHnTWLgl1CZX8PE+NqjJ/Hcd2t25BQJDxq88LwctLk3NcMw/lKG9UlHTRuo6l5mfJNhYrK3bDd20M90E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=TtdzEw7O; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="TtdzEw7O"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1750550590;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=NeumDkFpI/BQlNIX+gYJVU2yBgehN3xkABonM2vyk+Q=;
	b=TtdzEw7O/mAdUHWIR8RSMjZ9HgQ9c3ylms+sM6vYh7zTYLxFOIDTfqtW48ogRndrbD4m8C
	dD4co3ZYNjI8Dtx4DGuK9VMt8zx8/mW1Luu1DxKf5sZCMB/C6QY3yqwPPLdNSj19zPbp1T
	ZsFOS5SteUpiwLcQZqhsCaNGIQTZxdY=
Received: from mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-511-ALD09PqpNdSWsERPscE8iQ-1; Sat,
 21 Jun 2025 20:03:08 -0400
X-MC-Unique: ALD09PqpNdSWsERPscE8iQ-1
X-Mimecast-MFC-AGG-ID: ALD09PqpNdSWsERPscE8iQ_1750550587
Received: from mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id C781E18002E4
	for <llvm@lists.linux.dev>; Sun, 22 Jun 2025 00:03:07 +0000 (UTC)
Received: from [172.20.188.120] (unknown [10.30.45.122])
	by mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 4FA3130001A1;
	Sun, 22 Jun 2025 00:03:06 +0000 (UTC)
From: cki-project@redhat.com
Subject: =?utf-8?b?4pyF?= PASS (MISSED 4 of 100): Test report for master
 (6.16.0-rc2, upstream-mainline, 739a6c93)
Date: Sun, 22 Jun 2025 00:03:05 -0000
To: llvm@lists.linux.dev
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.4
Message-Id: <97411.125062120030800117@us-mta-511.us.mimecast.lan>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: zOaUOk7LVc14g1pS8qv2bNIAqlYP9PGUaTdPVxRB3pk_1750550587
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
    Commit message: Merge tag 'nfsd-6.16-1' of git://git.kernel.org/pub/scm=
/linux/kernel/git/cel/linux

You can find all the details about the test run at
    https://datawarehouse.cki-project.org/kcidb/checkouts/redhat:1882162793

One or more kernel tests failed:
    We also see the following known issues which are not related to your ch=
anges:
        Issue: (ppc64le) selinux-policy: serge-testsuite: ld: cannot find a=
rch/powerpc/lib/crtsavres.o: No such file or directory
            URL: https://issues.redhat.com/browse/RHELTEST-39
            Affected tests:
                selinux-policy: serge-testsuite [ppc64le]


Tests that were not ran because of internal issues:
    kselftests upstream - bpf [x86_64]
    kselftests upstream - bpf_test_progs [x86_64]
    kselftests upstream - net [x86_64]
    Reboot test [x86_64]


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

