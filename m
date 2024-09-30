Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F057194082
	for <llvm@lists.linux.dev>; Mon, 30 Sep 2024 21:13:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727730789; cv=none; b=U1sQQW5afXONcAZeD+cW6YnlazqwZKxUKEUwym1WCtgQiyGfMWek+XjGjq24M58MsZ4Qgld5tjXplATY7Zsg+if5KXqeap0VLuAUD5MB8t+af5JaCiRTZ0Plj5UPeTpSVEiX4jJ+HWJ2FT93OqxZ+42vqNyT2uqNHyV9OBoAycY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727730789; c=relaxed/simple;
	bh=yhooA3wROL8FTMhMW0Ff+1O+nb0bYhUAQ4urK2aGALo=;
	h=From:Subject:Date:To:MIME-Version:Message-Id:Content-Type; b=GCu0benUesa5avXlyDO99l9KVZSnzsQTL98kucP3O9D90AeabCpYuqgquPfj/+iEuS2O6pkTH85tJvfrHw64Yr6H+215I928W9+R15wp4V9Nu7AHcHJcfMi3zhdZ4SZdefNwEJ6A+mXBfSN2mgml61wXCGx2YLpYyaddPOqO8+Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Xu6qGXhH; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Xu6qGXhH"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1727730787;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=rs4GzoSg6jWleRgXO2iKXa2IKhvgMhMg8I2IHVEQRGw=;
	b=Xu6qGXhHdg2W38yzjr9Wj/DxG4KcV1DxLEARjnBUGB8XYmGUlngVNpB4dh9SopZ9yLpgQo
	qUD6QOeSU7ZEwbIn9MQEibbr2NMDmssHKAB9g2CQgW51U8GKQsVygwFzJu6rmDaEia3aXX
	So+3klKjhIskygQznQOwCEFpnf5Qirg=
Received: from mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-303-xF3Dx9cZMqOW2aBvxt53RQ-1; Mon,
 30 Sep 2024 17:13:06 -0400
X-MC-Unique: xF3Dx9cZMqOW2aBvxt53RQ-1
Received: from mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (unknown [10.30.177.17])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 5F2451919628
	for <llvm@lists.linux.dev>; Mon, 30 Sep 2024 21:13:05 +0000 (UTC)
Received: from [172.64.15.50] (unknown [10.30.34.46])
	by mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id D57241955DCE;
	Mon, 30 Sep 2024 21:13:04 +0000 (UTC)
From: cki-project@redhat.com
Subject: =?utf-8?b?4p2M?= FAIL: Test report for master (6.12.0-rc1,
 mainline.kernel.org-clang, e32cde8d)
Date: Mon, 30 Sep 2024 21:13:04 -0000
To: llvm@lists.linux.dev
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.17
Message-Id: <28285.124093017130600889@us-mta-303.us.mimecast.lan>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hi, we tested your kernel and here are the results:

    Overall result: FAILED
             Merge: OK
           Compile: FAILED


Kernel information:
    Commit message: Merge tag 'sched_ext-for-6.12-rc1-fixes-1' of git://git=
.kernel.org/pub/scm/linux/kernel/git/tj/sched_ext

You can find all the details about the test run at
    https://datawarehouse.cki-project.org/kcidb/checkouts/redhat:1476018531

One or more kernel builds failed:
    Unrecognized or new issues:
         ppc64le - https://datawarehouse.cki-project.org/kcidb/builds/redha=
t:1476018531-ppc64le-kernel
           s390x - https://datawarehouse.cki-project.org/kcidb/builds/redha=
t:1476018531-s390x-kernel
          x86_64 (debug) - https://datawarehouse.cki-project.org/kcidb/buil=
ds/redhat:1476018531-x86_64-kernel-debug


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

