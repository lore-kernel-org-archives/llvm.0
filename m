Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E8C4B673
	for <llvm@lists.linux.dev>; Tue,  1 Apr 2025 03:23:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743477787; cv=none; b=Vm2Ix6nxKn1o/zmV8tQrJNBirf/ykvQudUV73hACvreY4dTpC+mgpzAfsfK3UjCk0PxC7Gq+t75MzAH2T7NX5mHbX1b/cnYdHCLnfwymyvJ3rf8fYF7ueIMlpVs8G40uk1T1Pssd1pFFhFMJN2nbGb1F80BTGD7eCjszDTNiFhQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743477787; c=relaxed/simple;
	bh=smrKSUydvRiacZIfefxStSoGvwmhRUkYPp6+9z+n3tM=;
	h=From:Subject:Date:To:MIME-Version:Message-Id:Content-Type; b=i4dwU34dP6A0kqMYTxonbDADF9WtrltZrT9gc3yI1bSCM/oHz26avIKxQ7dX3r4ma2MIVijLRj28XBcpBM5+0OWZbbqK0UqRwswGxI34Aj40fESFpLSXq58mLzbOu4rHFCE6OoxVXXjZ/N2bGT6rc1oA0bzC2Mvc/Sg7G3am218=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=c8gpaCCt; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="c8gpaCCt"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1743477784;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=8gvJp6jgDk1eYQVh7j+bj7zuZuEu6MmOBSHLjrialM4=;
	b=c8gpaCCtexXLoAHi264IGqb7W+c1fHxZqJM47rLGAe5ksMoyqdc4aaKFdhzuQ3x0aK94Sk
	Soq6PWIRqjf+hNrKvYDhvTv9VdEQ1Y0QqUFlFR0KyXE/Iqc91iAGBCzZSh00tjyjYPXVPR
	VHzF3z4GGLTnqVKiisW152PdRnfjfU4=
Received: from mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-548-cN239JvsOBmRKuEimR5AMg-1; Mon,
 31 Mar 2025 23:23:02 -0400
X-MC-Unique: cN239JvsOBmRKuEimR5AMg-1
X-Mimecast-MFC-AGG-ID: cN239JvsOBmRKuEimR5AMg_1743477781
Received: from mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.111])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 7C4A4180025C
	for <llvm@lists.linux.dev>; Tue,  1 Apr 2025 03:23:01 +0000 (UTC)
Received: from [172.20.219.140] (unknown [10.30.44.44])
	by mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 0FCE71801747;
	Tue,  1 Apr 2025 03:23:00 +0000 (UTC)
From: cki-project@redhat.com
Subject: =?utf-8?b?4p2M?= FAIL: Test report for master (6.14.0,
 upstream-mainline, 08733088)
Date: Tue, 01 Apr 2025 03:23:00 -0000
To: llvm@lists.linux.dev
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.111
Message-Id: <48276.125033123230201460@us-mta-548.us.mimecast.lan>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: ukstYAUSmkLUrr43GUWIiau6urLQ9gtqPgbn8oki5hM_1743477781
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hi, we tested your kernel and here are the results:

    Overall result: FAILED
             Merge: OK
           Compile: FAILED


Kernel information:
    Commit message: Merge tag 'rust-fixes-6.15-merge' of git://git.kernel.o=
rg/pub/scm/linux/kernel/git/ojeda/linux

You can find all the details about the test run at
    https://datawarehouse.cki-project.org/kcidb/checkouts/redhat:1745743414

One or more kernel builds failed:
    Unrecognized or new issues:
          x86_64 (debug) - https://datawarehouse.cki-project.org/kcidb/buil=
ds/redhat:1745743414-x86_64-kernel-debug


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

