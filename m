Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D55810E9
	for <llvm@lists.linux.dev>; Thu,  7 Nov 2024 00:03:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730937791; cv=none; b=dN5sYs9hOcL20UFicIapThYjabdGfPgNXq5YAk6GCxNtCT4XcV/por+sppBpUSRs2z2p5jQBi+aotPnFEL3g4PS2DiN+VGwMTIQMiCYA4vji2t1p2DhFmlIcBhMAkU+UZTPICUFh79z4os5S15+m81+4B2A+QTuwCmlp0j2lSno=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730937791; c=relaxed/simple;
	bh=FH5+Vpm2EczA0fmJ86lM1nhB9Qy0/tjR5/v3MVh2Lrs=;
	h=From:Subject:Date:To:MIME-Version:Message-Id:Content-Type; b=B9Yyz/sV/q4Pjr9BQn867HeS2Q2pVwKva7Ypwt2BS/3SeIA+4K3oCt0yqrcc1lQTcsz6kkrtBI4HbgTHXucBDmXu/SLzDObg5mRsrim2tIIDKsBg3cl3scnBuruJq0KF2v8fDT6+PQxBqlClY5UGfQRDcKBvIZd9CeWyTgx2sSk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=AaQJUINb; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="AaQJUINb"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1730937785;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=Unr2n0emdlXuPpQNANZAr4dsKwS77ICprDqFr1D/ALI=;
	b=AaQJUINbmHk966h3HNy8ktq6wEjh+Jy70HhK62vq717MvDYXMmwROmm7yef5K6/4e3BWov
	+0nNwMRBeOZi5a71pvZTQZuRIG0TL6RXnYHUmTdKK2lOANmu9bGFBUCE5t5C6ZxiP7e8St
	NRdG03X2hBCDTN9DifegVwMtnsptxMw=
Received: from mx-prod-mc-02.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-370-VoHU5NEDNXGxUIIEJpIiKA-1; Wed,
 06 Nov 2024 19:03:03 -0500
X-MC-Unique: VoHU5NEDNXGxUIIEJpIiKA-1
X-Mimecast-MFC-AGG-ID: VoHU5NEDNXGxUIIEJpIiKA
Received: from mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.17])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-02.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id D2AB71955EE7
	for <llvm@lists.linux.dev>; Thu,  7 Nov 2024 00:03:02 +0000 (UTC)
Received: from [172.64.13.23] (unknown [10.30.32.164])
	by mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 7C90E1955F41;
	Thu,  7 Nov 2024 00:03:02 +0000 (UTC)
From: cki-project@redhat.com
Subject: =?utf-8?b?4p2M?= FAIL: Test report for master (6.12.0-rc6,
 upstream-mainline, ff7afaec)
Date: Thu, 07 Nov 2024 00:03:02 -0000
To: llvm@lists.linux.dev
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.17
Message-Id: <72560.124110619030400382@us-mta-370.us.mimecast.lan>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: z5fX0ObAQPtJssEDlT5wqk2t9XQtxJW0kw3JQaYn2jg_1730937783
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hi, we tested your kernel and here are the results:

    Overall result: FAILED
             Merge: OK
           Compile: FAILED


Kernel information:
    Commit message: Merge tag 'nfs-for-6.12-3' of git://git.linux-nfs.org/p=
rojects/anna/linux-nfs

You can find all the details about the test run at
    https://datawarehouse.cki-project.org/kcidb/checkouts/redhat:1530583379

One or more kernel builds failed:
    Unrecognized or new issues:
         ppc64le - https://datawarehouse.cki-project.org/kcidb/builds/redha=
t:1530583379-ppc64le-kernel
           s390x - https://datawarehouse.cki-project.org/kcidb/builds/redha=
t:1530583379-s390x-kernel
          x86_64 (debug) - https://datawarehouse.cki-project.org/kcidb/buil=
ds/redhat:1530583379-x86_64-kernel-debug


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

