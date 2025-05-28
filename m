Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36384286D74
	for <llvm@lists.linux.dev>; Wed, 28 May 2025 17:53:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748454801; cv=none; b=PT4ljvWiPRWeQo3X1NeCdrK9RZTSOoTSQ+agYYVYEQLH9Q/WSAR4E18Weu8eU80yoEUpFFCg1TrbY4KESNlsCepTYBGxA+lVorcOZOQl4fShglcIxcyxv1svc5AMu/VgIc+byBtWsY//NquASw3Tt6vP/hQqR693F/GoK5h0W0k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748454801; c=relaxed/simple;
	bh=WskK2sjC5YTDWqRoIUeTyXwhS4kbuNoy+rOlJtpGfz4=;
	h=From:Subject:Date:To:MIME-Version:Message-Id:Content-Type; b=S8fcgUI4QRCRc8Ix2hRUfHx+XMXHGNX9/O4J7udX8iXYGOfVK9JSzM3kYsSBNLwqhSaqVfiQSWa0odzvpAjpPE/uAKJd6S40IXNfZDjwul88cpt+YTmwTpkcDCk+DTcaB/bs4+sVHNbnNRGbV+w+cIxtQAt4MQNEBN4DkX8RQ/w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=SFBL6xZF; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="SFBL6xZF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1748454798;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=RKvNm0byytTZ6qwBoFnpWb9o08E9mJ9RIg8cdN82hKg=;
	b=SFBL6xZFqgCKkRlfdlEtIG6W7ebbL4FJUXbWQeCZswVyb3Asycj86p2mgehGRUVWOkwBaV
	z33aYUjmmjQDiq9LO4+nNKvtUMQ6hHDU0uM4upN889Ue9w8z9SE3eEuFatq3o7BnzVs/oc
	HUQOpVOPEKg7P24mRHoZAP9p8H4d7zA=
Received: from mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-102-xWytOIKVPnyfbpzV_8UzcA-1; Wed,
 28 May 2025 13:53:15 -0400
X-MC-Unique: xWytOIKVPnyfbpzV_8UzcA-1
X-Mimecast-MFC-AGG-ID: xWytOIKVPnyfbpzV_8UzcA_1748454795
Received: from mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.111])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 9CA421801A14
	for <llvm@lists.linux.dev>; Wed, 28 May 2025 17:53:07 +0000 (UTC)
Received: from [172.20.48.73] (unknown [10.30.45.91])
	by mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id C262218001D8;
	Wed, 28 May 2025 17:53:04 +0000 (UTC)
From: cki-project@redhat.com
Subject: =?utf-8?b?4p2M?= FAIL: Test report for master (6.15.0,
 upstream-mainline, 3d413f0c)
Date: Wed, 28 May 2025 17:53:04 -0000
To: llvm@lists.linux.dev
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.111
Message-Id: <46613.125052813531506579@us-mta-102.us.mimecast.lan>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: -VxHwBRVsfpfhgMKIsnQxYbBuPm_JsjpqFHSs6tQE50_1748454795
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hi, we tested your kernel and here are the results:

    Overall result: FAILED
             Merge: OK
           Compile: FAILED


Kernel information:
    Commit message: Merge tag 'audit-pr-20250527' of git://git.kernel.org/p=
ub/scm/linux/kernel/git/pcmoore/audit

You can find all the details about the test run at
    https://datawarehouse.cki-project.org/kcidb/checkouts/redhat:1841403347

One or more kernel builds failed:
    Unrecognized or new issues:
          x86_64 (debug) - https://datawarehouse.cki-project.org/kcidb/buil=
ds/redhat:1841403347-x86_64-kernel-debug


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

