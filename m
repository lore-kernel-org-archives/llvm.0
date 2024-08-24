Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E33FA5F
	for <llvm@lists.linux.dev>; Sat, 24 Aug 2024 02:52:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724467929; cv=none; b=JbjFKomPrC3PLF3kVKV8wXAUos3tUyZmeLH7qu82SOAXw4SPnCbEvvWezWGwpSXnRNmb0/nJwWdZQu05MDi3gpxGqL0rwh1vB2Rcr056wSq8CiUgI0vu4xyrFu3BR1Jz8tdddTTxq1cFRQI0IqJy0YLll4u28grO3BrrTE+Giz8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724467929; c=relaxed/simple;
	bh=Ccxbyflai2pk744cO+Dy3g5WfTGhqP1D1BrhGifXEPg=;
	h=From:Subject:Date:To:MIME-Version:Message-Id:Content-Type; b=WNKmyySvJHVxj+eHkDe5fJrhejJvJZFFKESkUE+ayveJPNj78TmgmMfq6ZlzqcSq8BIITFm5lRb77kKP5c4vV9jakjjx1J65dncMDRD0z0vEWRNtJlf9dO+HqVT8vJj9gr15wS9Ug+Bbt9Ywli7IvXvQ45aEohEdBuYtQlw9us4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=UMCSBBPf; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="UMCSBBPf"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1724467925;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=b8HQttwTb33/iFOp5Sv43QG5YyqTYnmDEqYqCSN1Auk=;
	b=UMCSBBPfTPlC7lSz8k+Zh/i6Zr7eBoQK7R+L8kd6lel+fopE90MAzt05G+lR0pRqCXYUDO
	CGcOkT7WPFs9pY5xm1CKkFrve1CafzTmwC1cxenBaksvCDgMS0U9M2AHu3SAxy4AY+/4+N
	u6UG/xRXktMHv96Y/PCoaQSqBBZIrNY=
Received: from mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-556-gYJx2HUlNVGXKkRsB0pTBA-1; Fri,
 23 Aug 2024 22:52:04 -0400
X-MC-Unique: gYJx2HUlNVGXKkRsB0pTBA-1
Received: from mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.40])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 11E271955D47
	for <llvm@lists.linux.dev>; Sat, 24 Aug 2024 02:52:03 +0000 (UTC)
Received: from [172.64.0.35] (unknown [10.30.32.160])
	by mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 7582119560A3;
	Sat, 24 Aug 2024 02:52:02 +0000 (UTC)
From: cki-project@redhat.com
Subject: =?utf-8?b?4p2M?= FAIL: Test report for master (6.11.0-rc4,
 mainline.kernel.org-clang, 60f0560f)
Date: Sat, 24 Aug 2024 02:52:02 -0000
To: llvm@lists.linux.dev
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.40
Message-Id: <89970.124082322520400136@us-mta-556.us.mimecast.lan>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hi, we tested your kernel and here are the results:

    Overall result: FAILED
             Merge: OK
           Compile: FAILED


Kernel information:
    Commit message: Merge tag 'nfs-for-6.11-2' of git://git.linux-nfs.org/p=
rojects/anna/linux-nfs

You can find all the details about the test run at
    https://datawarehouse.cki-project.org/kcidb/checkouts/redhat:1425503328

One or more kernel builds failed:
    Unrecognized or new issues:
         ppc64le - https://datawarehouse.cki-project.org/kcidb/builds/redha=
t:1425503328-ppc64le-kernel
           s390x - https://datawarehouse.cki-project.org/kcidb/builds/redha=
t:1425503328-s390x-kernel
          x86_64 (debug) - https://datawarehouse.cki-project.org/kcidb/buil=
ds/redhat:1425503328-x86_64-kernel-debug


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

