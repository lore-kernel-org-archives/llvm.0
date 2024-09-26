Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9939F1C687
	for <llvm@lists.linux.dev>; Thu, 26 Sep 2024 14:14:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727360091; cv=none; b=Dk5Bh9+wd5zxZWl1zg9hZHmDTpHRufVs5PQXWmNX9tZQPtVRrDWnGVVNQnxYC/HJ4Njb5MWsxnsg+V2poItIxN73pfpRGBGFgh850RcHQCjjX0m5e3az+No4Qg/NU7zbDVJqSSTHb1pZYGrktbcXusBdqER4SjUIcLu563G9fYM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727360091; c=relaxed/simple;
	bh=pajZ7Fgobww1BY6VGUz2FYi+pwVYqpRTcNxVY2zLS8M=;
	h=From:Subject:Date:To:MIME-Version:Message-Id:Content-Type; b=DelhEA6KZncgddL76qICyPl0ekea8pqQzjoPlz1PAgatgwdi9ygnHq9glXWxqXD+EeaXibobMgnA5lgY9Qvy0udPqojH9bsqMsKyXpYnrF/tc6u9Hr0Cbd4Z1MmLS1CRzp7aHt4ema1PE9+SXglJX+Z7G2tT/54xVAF2gPZJKUQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=BP5BdTlc; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="BP5BdTlc"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1727360088;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=mpTTpywQj9GkSkkxrP3my6d4bp05pGifjvpaqJ7G/Vo=;
	b=BP5BdTlcvDqRTr9bN2ok0Y6eYfzHOqkQ47KXblTlhykSCd2kKa0/3Oov/9eK4ABptjmxxr
	gJ+9Foz4DAAZFE/zDWGR6TgCr+TaJQvmnANmE0u7gWXWtt/ziScEzovJpDFMGBv1WtZw45
	XbYInqEzhzn68qY8fuLjWjZEAB5scm4=
Received: from mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-354-qpFHyUNEPK2aY4TlrOwvAg-1; Thu,
 26 Sep 2024 10:14:47 -0400
X-MC-Unique: qpFHyUNEPK2aY4TlrOwvAg-1
Received: from mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com (unknown [10.30.177.15])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 31D3B18B324C
	for <llvm@lists.linux.dev>; Thu, 26 Sep 2024 14:14:46 +0000 (UTC)
Received: from [172.64.15.17] (unknown [10.30.34.46])
	by mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id F05F41979063;
	Thu, 26 Sep 2024 14:14:45 +0000 (UTC)
From: cki-project@redhat.com
Subject: =?utf-8?b?4p2M?= FAIL: Test report for master (6.11.0,
 mainline.kernel.org-clang, 2f27fce6)
Date: Thu, 26 Sep 2024 14:14:45 -0000
To: llvm@lists.linux.dev
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.15
Message-Id: <09920.124092610144700223@us-mta-354.us.mimecast.lan>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hi, we tested your kernel and here are the results:

    Overall result: FAILED
             Merge: OK
           Compile: FAILED


Kernel information:
    Commit message: Merge tag 'sound-6.12-rc1' of git://git.kernel.org/pub/=
scm/linux/kernel/git/tiwai/sound

You can find all the details about the test run at
    https://datawarehouse.cki-project.org/kcidb/checkouts/redhat:1457174886

One or more kernel builds failed:
    Unrecognized or new issues:
         ppc64le - https://datawarehouse.cki-project.org/kcidb/builds/redha=
t:1457174886-ppc64le-kernel
           s390x - https://datawarehouse.cki-project.org/kcidb/builds/redha=
t:1457174886-s390x-kernel
          x86_64 (debug) - https://datawarehouse.cki-project.org/kcidb/buil=
ds/redhat:1457174886-x86_64-kernel-debug


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

