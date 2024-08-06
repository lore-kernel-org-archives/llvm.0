Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C37E8145A0C
	for <llvm@lists.linux.dev>; Tue,  6 Aug 2024 19:22:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722972131; cv=none; b=Gx+J3tXcMLnk8up5e/dNjDpHz5SQYLMq1+oikpL+C7/k2dj1UJCP0UzAym+aDTMAp40WRoUT3f/ignq7qLTaEc2Vjhf5pSqZoAECeAbCAhza0nFnSY+WQN6zZ+DiPJ+WxwtFdLg4/p1l8/HBOHfevwcLu1SyG3+hRkkkoF8k2uo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722972131; c=relaxed/simple;
	bh=obekCJMH9hjZiOsyCJjq1SGLhEy+KSx3KxZM8u4O1g4=;
	h=From:Subject:Date:To:MIME-Version:Message-Id:Content-Type; b=EmJz0oPTTk84ruI+47pLh5D92EzBs7+1FRVZ6B8SaNES8cVkPJmRi5XNbKYxo9HFRfwx3nhYnlc6DWBjHm0cvuZ42Gldx0jLRkhCLZlpBaCIfHDUoBe0OfMTgMNE9RyPhIvR3Ey1SImdJv4oWs5+npSQ+dIyWuOe5qEVoeSk/Jw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Enl1TbVI; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Enl1TbVI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1722972128;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=AorMNVrBWthTp7KUrAEpOR5M6amABUMMjVELRffrrBo=;
	b=Enl1TbVIPkygRf7Rc5gOuhiasZg/biP/NaDNcVhSjeqAU9LHJXQtpb2LVUWQ+DhB2KUKnq
	ZzWCRhZMSRypatluO9K2hCsgHTu6co3TKGhmGc4Yh5kFuBlKjU89Al00FOhVpX9G029NEE
	9VsEAe+fxMBKTQS54/r1fpWIBkpYY2Q=
Received: from mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-507-1UliTVcPPveC6phggxruCA-1; Tue,
 06 Aug 2024 15:22:05 -0400
X-MC-Unique: 1UliTVcPPveC6phggxruCA-1
Received: from mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 7DAD0195608A
	for <llvm@lists.linux.dev>; Tue,  6 Aug 2024 19:22:04 +0000 (UTC)
Received: from [172.64.15.28] (unknown [10.30.34.46])
	by mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id DAA3D300022B;
	Tue,  6 Aug 2024 19:22:03 +0000 (UTC)
From: cki-project@redhat.com
Subject: =?utf-8?b?4p2M?= FAIL: Test report for master (6.11.0-rc2,
 mainline.kernel.org-clang, d4560686)
Date: Tue, 06 Aug 2024 19:22:03 -0000
To: llvm@lists.linux.dev
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.4
Message-Id: <96855.124080615220501723@us-mta-507.us.mimecast.lan>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hi, we tested your kernel and here are the results:

    Overall result: FAILED
             Merge: OK
           Compile: FAILED


Kernel information:
    Commit message: Merge tag 'for_linus' of git://git.kernel.org/pub/scm/l=
inux/kernel/git/mst/vhost

You can find all the details about the test run at
    https://datawarehouse.cki-project.org/kcidb/checkouts/redhat:1403108841

One or more kernel builds failed:
    Unrecognized or new issues:
         ppc64le - https://datawarehouse.cki-project.org/kcidb/builds/redha=
t:1403108841-ppc64le-kernel
           s390x - https://datawarehouse.cki-project.org/kcidb/builds/redha=
t:1403108841-s390x-kernel
          x86_64 (debug) - https://datawarehouse.cki-project.org/kcidb/buil=
ds/redhat:1403108841-x86_64-kernel-debug


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

