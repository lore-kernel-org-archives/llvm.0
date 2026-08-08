Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A6051B4F09
	for <llvm@lists.linux.dev>; Sat,  8 Aug 2026 01:02:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786150936; cv=none; b=cAeWm96ky8xNiDrfQ0rSkWFCjXSKu9Z4SC6ZHfvSwSC2qj/TnXYyuDxUKRaD301M4UykMZkOty61c9GVy9pPUnxOcALDQntkgYswmyt4TfJVh955KnafVljCE58chv3j1n38Zy9G9xgEJqYpjmwwRmUqoXBni9JZ7EKp2gan7xU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786150936; c=relaxed/simple;
	bh=Ef7pDGV3hNCodQUd14jAg/pmar+0bdzDwMBY0I0ZRaI=;
	h=From:Subject:Date:To:MIME-Version:Message-Id:Content-Type; b=qmeK3u+zFYvi7RxXaMKm9oPcZuZY1L8qP68ImyPovNXAPSSvW6fqewgiLikl6gdlOxEoKC5rLmZyUFwfYosZ/4dqMhvOZsHuR03wp/dOnCxLDkrLnkR2i5+KnhhlHC11QAKmF/1MN4IWXekCPgUf1IuhtQyd3PT/GpTfSWY5GHg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=V145NUS9; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="V145NUS9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1786150934;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=a/UJ56AfDMEUZwqkUliyCVvbmlxinr2jBGt80zjO3Y0=;
	b=V145NUS9FlNH2JV8JxEAeeWdf2r9I1SohOuaWdgkEp++3HIKaf88/Zna2fMwuXqt72a0Fh
	2JITYCeILWo+ZwhYZ2Um2u//P+5JX6un3YUHtQ7GPhA0ki1mA6Qb745hn5EZ4JuxEygapn
	6S2B4OTQgxhyB8RY5xHZBk1JDq+9qPI=
Received: from mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-1-rjAPwU0bOJeM781B_pJBiA-1; Fri,
 07 Aug 2026 21:02:07 -0400
X-MC-Unique: rjAPwU0bOJeM781B_pJBiA-1
X-Mimecast-MFC-AGG-ID: rjAPwU0bOJeM781B_pJBiA_1786150927
Received: from mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.12])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id DC3F019560B4
	for <llvm@lists.linux.dev>; Sat,  8 Aug 2026 01:02:06 +0000 (UTC)
Received: from [172.20.35.218] (unknown [10.30.44.80])
	by mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 61224195DF93;
	Sat,  8 Aug 2026 01:02:06 +0000 (UTC)
From: cki-project@redhat.com
Subject: =?utf-8?b?4pyF?= PASS (MISSED 60 of 66): Test report for master
 (7.2.0-rc6, upstream-mainline, f9a2394a)
Date: Sat, 08 Aug 2026 01:02:05 -0000
To: llvm@lists.linux.dev
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.12
Message-Id: <42323.126080721020700801@us-mta-1.us.mimecast.lan>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: h-pZ94P3teD1GHoJl1gFyoMlpDrLVxd4zvYT8bIkUdk_1786150927
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
    Commit message: Merge tag 'mm-hotfixes-stable-2026-08-06-18-44' of git:=
//git.kernel.org/pub/scm/linux/kernel/git/akpm/mm

You can find all the details about the test run at
    https://datawarehouse.cki-project.org/kcidb/checkouts/redhat:2739444881

Tests that were not ran because of internal issues:
    /distribution/check-install [aarch64, x86_64]
    /distribution/command [aarch64, x86_64]
    /test/misc/machineinfo [aarch64, x86_64]
    Boot test [aarch64, x86_64]
    CKI/restraint [aarch64, x86_64]
    Reboot test [aarch64, x86_64]
    SELinux Custom Module Setup [aarch64, x86_64]
    selinux-policy: serge-testsuite [aarch64, x86_64]
    Storage - blktests - throtl [aarch64, x86_64]
    Storage - blktests - ublk [aarch64, x86_64]
    stress: stress-ng - cpu-cache [aarch64, x86_64]
    stress: stress-ng - memory [aarch64, x86_64]
    xfstests - btrfs [aarch64, x86_64]
    xfstests - cifsv3.11 [x86_64]
    xfstests - ext4 [aarch64, x86_64]
    xfstests - nfsv4.2 [x86_64]
    xfstests - xfs [aarch64, x86_64]


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

