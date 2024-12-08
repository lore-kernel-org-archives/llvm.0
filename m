Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1C2D37160
	for <llvm@lists.linux.dev>; Sun,  8 Dec 2024 20:02:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733688131; cv=none; b=AIUQRtKlAvjBevADcgxxHCjoMsTvjyipLTD8H2irmUk/suFOOp3ve0nRkA8j+82V5COSCng2tBxzTFUaL3cJVpBdTbn7fOS8DYyZRvljQQx1ClMMbGQl5U2BNEsXFrKO6+ewLrbEdsyjD8YyV3OaLShSBRrzUOZfdVdsct5ENfk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733688131; c=relaxed/simple;
	bh=F5qEh9cgtpyzgjLjGfCJvYDqiEbkF1QABKUIOU/6x4E=;
	h=From:Subject:Date:To:MIME-Version:Message-Id:Content-Type; b=gvqDm9yqHBaYxZn5TzW3eokkFDG6JoI4ipVZgT57Olnly4HlrBxt5Dwlx2S9ozxoC3jzPViyBMPU8QT6N1uTT1/Zs38IBA4LrBk0DiO5QsOaA+M5ErDjByC9DIkuFLVOVCC4j+MgQ7plH2Sm3Avhywy5F7nZWYNKnyuxgR+bLm8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=SBD6x/3f; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="SBD6x/3f"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1733688128;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=FFfp69YuOadWhljs/jdzdmWdkW6x3NNT2G6R0tl7vT8=;
	b=SBD6x/3fh+KsCGGZ6jleCZnpu5u8XmI8q7mWhGoKqjRNdbqAyI12pyT+cCiHv1jYoMZqAW
	ZaspZHJRfLXUJ1iuriLHdibBKv/9Q57dEnMJCqU1u/W6p0xV9Rpz2OZu9r1ZY+rEPfyMnH
	In31O9Gd7av8VQSKs5+S4lYhyQWBi+g=
Received: from mx-prod-mc-04.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-471-2CAdW2L4NR-IYfqoiLBYWw-1; Sun,
 08 Dec 2024 15:02:07 -0500
X-MC-Unique: 2CAdW2L4NR-IYfqoiLBYWw-1
X-Mimecast-MFC-AGG-ID: 2CAdW2L4NR-IYfqoiLBYWw
Received: from mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.12])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-04.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 4B6EF1955E80
	for <llvm@lists.linux.dev>; Sun,  8 Dec 2024 20:02:06 +0000 (UTC)
Received: from [172.64.3.41] (unknown [10.30.32.189])
	by mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id D089F19560A2;
	Sun,  8 Dec 2024 20:02:05 +0000 (UTC)
From: cki-project@redhat.com
Subject: =?utf-8?b?4p2M?= FAIL: Test report for master (6.13.0-rc1,
 upstream-mainline, 62b5a469)
Date: Sun, 08 Dec 2024 20:02:05 -0000
To: llvm@lists.linux.dev
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.12
Message-Id: <53599.124120815020702983@us-mta-471.us.mimecast.lan>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: h4hT3bKl72OmPKZf382x30WvrWMqGgoyQ6TqFBHb-kg_1733688126
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hi, we tested your kernel and here are the results:

    Overall result: FAILED
             Merge: OK
           Compile: FAILED


Kernel information:
    Commit message: Merge tag '6.13-rc1-smb3-client-fixes' of git://git.sam=
ba.org/sfrench/cifs-2.6

You can find all the details about the test run at
    https://datawarehouse.cki-project.org/kcidb/checkouts/redhat:1579209126

One or more kernel builds failed:
    Unrecognized or new issues:
         ppc64le - https://datawarehouse.cki-project.org/kcidb/builds/redha=
t:1579209126-ppc64le-kernel
          x86_64 - https://datawarehouse.cki-project.org/kcidb/builds/redha=
t:1579209126-x86_64-kernel
          x86_64 (debug) - https://datawarehouse.cki-project.org/kcidb/buil=
ds/redhat:1579209126-x86_64-kernel-debug


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

