Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 932BD5258
	for <llvm@lists.linux.dev>; Thu, 26 Sep 2024 14:31:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727361113; cv=none; b=EIUzIiEQ4j3qfUs/XGHpYpD41dyGHQ1eQDv08NI7Pl7VUUfW22Mm0DFysqDqtnKZ/JeMiCaic6qXYdaMzXPXLlQelhU0b01ODOn6w+brIZefCsdQxngBD7QRrDNUDD3N6wdklGbSdnGahJWaMJ3L5Fg186szDrw1UlBL1ssfDbY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727361113; c=relaxed/simple;
	bh=MzMXLfp49ivEFsqFXiApeDgVO1R9YIFc+lEGUiFeK98=;
	h=From:Subject:Date:To:MIME-Version:Message-Id:Content-Type; b=REU76cUTFB3eisQMqLCVOsltB2YqFiVULQoaqZf0qZupr66FV2qIpDtzJjKtNjDVP2rwlhlNSEkCLzMy/Hcz8d9KGUWdBKpJK10uy1kChejCBYblnUfBM+YTdYih6D2tRnl/Ijn0apmEIpWkV+zNC/nzZp/q98G3LXIt3zT+gJM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=ir7u9M/z; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="ir7u9M/z"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1727361110;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=twva1KlrVh/p4K+llwbXxsysoI2Q44SSvmiwC6dbE08=;
	b=ir7u9M/zOs3neD8jBgCeCJ2oegetiqeuKj0EQIr5fCD/ew8XxEre0CKgOU2urUQbUzAeFC
	ldpdr+mI07rNQ9mPWZpN07i4GeDPwgWSRDRtbAZKLOGsXR06+k8YkKjDFLLEsd1BdwzqIb
	yQppQ3ysdMwPShI2CRGzMuI0/P54cUs=
Received: from mx-prod-mc-04.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-191-oY5cqwtUO5a-6mZB94RPKQ-1; Thu,
 26 Sep 2024 10:31:49 -0400
X-MC-Unique: oY5cqwtUO5a-6mZB94RPKQ-1
Received: from mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (unknown [10.30.177.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-04.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 7538019776D1
	for <llvm@lists.linux.dev>; Thu, 26 Sep 2024 14:31:46 +0000 (UTC)
Received: from [172.64.15.17] (unknown [10.30.34.46])
	by mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id EE7103003DF2;
	Thu, 26 Sep 2024 14:31:45 +0000 (UTC)
From: cki-project@redhat.com
Subject: =?utf-8?b?4p2M?= FAIL: Test report for master (6.11.0-rc5,
 mainline.kernel.org-clang, fb24560f)
Date: Thu, 26 Sep 2024 14:31:45 -0000
To: llvm@lists.linux.dev
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.4
Message-Id: <26607.124092610314902291@us-mta-191.us.mimecast.lan>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hi, we tested your kernel and here are the results:

    Overall result: FAILED
             Merge: OK
           Compile: FAILED


Kernel information:
    Commit message: Merge tag 'lsm-pr-20240830' of git://git.kernel.org/pub=
/scm/linux/kernel/git/pcmoore/lsm

You can find all the details about the test run at
    https://datawarehouse.cki-project.org/kcidb/checkouts/redhat:1434107613

One or more kernel builds failed:
    Unrecognized or new issues:
         ppc64le - https://datawarehouse.cki-project.org/kcidb/builds/redha=
t:1434107613-ppc64le-kernel
           s390x - https://datawarehouse.cki-project.org/kcidb/builds/redha=
t:1434107613-s390x-kernel
          x86_64 (debug) - https://datawarehouse.cki-project.org/kcidb/buil=
ds/redhat:1434107613-x86_64-kernel-debug


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

