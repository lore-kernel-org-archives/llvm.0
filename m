Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2616518027
	for <llvm@lists.linux.dev>; Fri, 13 Dec 2024 19:22:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734117730; cv=none; b=LSZ/2Tqsqx6yY7abRXfa6Vv3FZO8DjixFkYvLQvsDKZ0zpoW8nobyMJu3eiTIaeKFiDDKxjIPFYbKwwKf8rBlG+5TNxB9Kl1Il289FPFjIv1gfJG6Mskh6Xu4sL1gD6p9kp8OkVFrZL6UIXbQbV7iVEen0+L/ufaqE7jtTz1prw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734117730; c=relaxed/simple;
	bh=jZc+iFTPavsF+IpxZqwzmnemfF/s4vEvBwJjDRuq3b4=;
	h=From:Subject:Date:To:MIME-Version:Message-Id:Content-Type; b=OwaK6Ga7jckWYL3/bCjSivJ4Ufjg341jAeQl6KdwaBsxAB42Hn176FY8q6GH8kv0YoSQxZbldNrRNIsRJeKZOn4hiSRqnNToaLQnt3xC8zkTrIZ3EeuwH0T+FVH0W2VRCTErCLbaCr/FP0IgvBaJzSIqUV9o5BZhf2+y80L2VS8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=PyyIGh1t; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="PyyIGh1t"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1734117728;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=I7nQig9XKJI9KOfN44B5fPKJNw8/e7eCeOBrV7HWPTg=;
	b=PyyIGh1tOTPhZGlxtKyf37hw7qVcjTgOlSZeQNEe60/e3oncN5oOtgWKaw/SZrwu0UaBQR
	ImqRca1YC3Ssh9i/W1kQ7aNqphFogQzNQJcCCmgM2fjEU8RSGnivi7olqj+uQ6OgvIPJP3
	k8NUi3N4313qy4o+4NqFJcP7d7FwfYc=
Received: from mx-prod-mc-04.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-488-ZE2zoEiZO8aO_6m6M7XHSQ-1; Fri,
 13 Dec 2024 14:22:06 -0500
X-MC-Unique: ZE2zoEiZO8aO_6m6M7XHSQ-1
X-Mimecast-MFC-AGG-ID: ZE2zoEiZO8aO_6m6M7XHSQ
Received: from mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.12])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-04.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id A4B5319560A3
	for <llvm@lists.linux.dev>; Fri, 13 Dec 2024 19:22:05 +0000 (UTC)
Received: from [172.64.12.26] (unknown [10.30.33.24])
	by mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 319CE195394B;
	Fri, 13 Dec 2024 19:22:04 +0000 (UTC)
From: cki-project@redhat.com
Subject: =?utf-8?b?4p2M?= FAIL: Test report for master (6.13.0-rc2,
 upstream-mainline, 243f750a)
Date: Fri, 13 Dec 2024 19:22:04 -0000
To: llvm@lists.linux.dev
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.12
Message-Id: <47900.124121314220601107@us-mta-488.us.mimecast.lan>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: etJq7HPXYSQBHvnZLubxE1kK2Pt0rxHRBULS63BM9-c_1734117725
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hi, we tested your kernel and here are the results:

    Overall result: FAILED
             Merge: OK
           Compile: FAILED


Kernel information:
    Commit message: Merge tag 'gpio-fixes-for-v6.13-rc3' of git://git.kerne=
l.org/pub/scm/linux/kernel/git/brgl/linux

You can find all the details about the test run at
    https://datawarehouse.cki-project.org/kcidb/checkouts/redhat:1587942767

One or more kernel builds failed:
    Unrecognized or new issues:
         ppc64le - https://datawarehouse.cki-project.org/kcidb/builds/redha=
t:1587942767-ppc64le-kernel
          x86_64 (debug) - https://datawarehouse.cki-project.org/kcidb/buil=
ds/redhat:1587942767-x86_64-kernel-debug
    We also see the following known issues which are not related to your ch=
anges:
          x86_64 - https://datawarehouse.cki-project.org/kcidb/builds/redha=
t:1587942767-x86_64-kernel
                   Issue: Kernel build: arch/x86/tools/insn_decoder_test: e=
rror: malformed line
                          https://github.com/Rust-for-Linux/linux/issues/11=
34


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

