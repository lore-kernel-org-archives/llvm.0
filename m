Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67FE86F073
	for <llvm@lists.linux.dev>; Wed, 11 Dec 2024 03:42:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733888530; cv=none; b=lzdB5t/Wwn9iMkxq5rCrIGf2dAx/8rJvBEx6GwbG/B4wJjLGhGyMG7G5X9FBUCtosdaUAw17yj6E82SikiT7RRrHWnnssYWMiCFAhRQnFb6U0fXW5EESqxBNtz1t7aBGeKCjrz/kmqHBmskD0KaTbAFwJFmOge9tWl9XOMleAEc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733888530; c=relaxed/simple;
	bh=/yf6TfgaP8OXHhaAXm94ONFO7AhfV7inJPLoFprqa+Y=;
	h=From:Subject:Date:To:MIME-Version:Message-Id:Content-Type; b=lrspfmGk6QQNUya2oQqKWP2Fk8fXh3HaGhEWhLSdFqxIEcmj3xmTpsUEZXIyGzRG7PGWzScfECwdC7hl2q8pFdzcLvjnMOBQ5+PoXgW8rgPaGPfpDOCqzscDo4BBx3MasUuzNrv9Nk3LpoURuClK/KPmjG68iD/6Ed66DS4N//o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=NRiP/tZm; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="NRiP/tZm"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1733888527;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=sSHQX0g9vzt/QlYt9w6CsrKIqQFbgPqrgmCAk3gYUEk=;
	b=NRiP/tZm2gRvd02vxHDsxDJXyusyg93dzHU1Itz0/Kc5PHS32SVOlE25pfIG6Nf/Dg0+UD
	wZJQoJ4YE3Mk3F79LZvjjYXgjIn2MsSqv1gju3RCdzg2sd40BoWrgnWm5DliK1PXDTmPOh
	/MHAlhgeiB/SdiTl/EyGwWvFJe4oUMM=
Received: from mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-600-D2pDeZLEMIW4uB_Rakj7Kg-1; Tue,
 10 Dec 2024 22:42:05 -0500
X-MC-Unique: D2pDeZLEMIW4uB_Rakj7Kg-1
X-Mimecast-MFC-AGG-ID: D2pDeZLEMIW4uB_Rakj7Kg
Received: from mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.17])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id A343219560AE
	for <llvm@lists.linux.dev>; Wed, 11 Dec 2024 03:42:04 +0000 (UTC)
Received: from [172.64.12.26] (unknown [10.30.33.24])
	by mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 270F01956048;
	Wed, 11 Dec 2024 03:42:03 +0000 (UTC)
From: cki-project@redhat.com
Subject: =?utf-8?b?4p2M?= FAIL: Test report for master (6.13.0-rc2,
 upstream-mainline, f92f4749)
Date: Wed, 11 Dec 2024 03:42:03 -0000
To: llvm@lists.linux.dev
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.17
Message-Id: <44889.124121022420500326@us-mta-600.us.mimecast.lan>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 07XMvKFOzImQscMUN-lZuLVPC-vK0Z0ZWBOKcrV_yCc_1733888524
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hi, we tested your kernel and here are the results:

    Overall result: FAILED
             Merge: OK
           Compile: FAILED


Kernel information:
    Commit message: Merge tag 'clk-fixes-for-linus' of git://git.kernel.org=
/pub/scm/linux/kernel/git/clk/linux

You can find all the details about the test run at
    https://datawarehouse.cki-project.org/kcidb/checkouts/redhat:1583189702

One or more kernel builds failed:
    Unrecognized or new issues:
         ppc64le - https://datawarehouse.cki-project.org/kcidb/builds/redha=
t:1583189702-ppc64le-kernel
          x86_64 - https://datawarehouse.cki-project.org/kcidb/builds/redha=
t:1583189702-x86_64-kernel
          x86_64 (debug) - https://datawarehouse.cki-project.org/kcidb/buil=
ds/redhat:1583189702-x86_64-kernel-debug


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

