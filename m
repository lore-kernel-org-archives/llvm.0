Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56C8E2AE8E
	for <llvm@lists.linux.dev>; Mon, 30 Sep 2024 13:33:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727703235; cv=none; b=CS86Iz+WA9+yHoknhsNgF82pdTnjUmM+Ito3UMO1uEzZ+GDI+Z8F2olO48XBwmvh4iNS9hAtgjB7NDews5uo4xAvzbGjqRhPV8Anz+1A627k7PjpDulnI0MmH32UqbWHbs5dbXd5NOTEkQF99wIBafLZG1NcAj2UDT+awqHjbXg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727703235; c=relaxed/simple;
	bh=k5/GbeG8pr4946NLtkGHwDZem+b2J/3yn8CFN9gKVW0=;
	h=From:Subject:Date:To:MIME-Version:Message-Id:Content-Type; b=Mypn09jBkTqYCxBHZXRKGE+/ve0z5FWhSszokxI++0ZX3YaXAMGZWLzr+VqEGpyXbcguBQ+O1YqkgVUOa2i7F2dFmaf7SYM7XHLvMm3w97Ppeb63kkRUa63lRdIMLt+9JK5c7M+QWYv2r8E2gp+5pBjeeUaUPgWS2wx55hucUB0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=hq/xf5Ab; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="hq/xf5Ab"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1727703233;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=kaqDDbpAea95AxgUhENly4JxWFATV59jJ1jZXNVxvnY=;
	b=hq/xf5AbJZ2bGR6hRqD5Di1y1k3iddJG9KkuDJ39H2vCqXDSA1VSLr8IMC9+R4LoUNzXQh
	5WjtI2DzjtSiMqJt1Dee5TG1wvK+up6SB3h7zOLuvizDvsalW5pYi5mY2gZM8778n/kJGG
	i6oV3ewH7WSigMUN+3nPQjPVFQGMvhQ=
Received: from mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-232-ynq261EBNei7M4OsMvYNpw-1; Mon,
 30 Sep 2024 09:33:52 -0400
X-MC-Unique: ynq261EBNei7M4OsMvYNpw-1
Received: from mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com (unknown [10.30.177.40])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 2F1AA196E0AB
	for <llvm@lists.linux.dev>; Mon, 30 Sep 2024 13:33:48 +0000 (UTC)
Received: from [172.64.3.33] (unknown [10.30.33.101])
	by mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id EAA0E19560AA;
	Mon, 30 Sep 2024 13:33:47 +0000 (UTC)
From: cki-project@redhat.com
Subject: =?utf-8?b?4p2M?= FAIL: Test report for master (6.11.0,
 mainline.kernel.org-clang, 62a0e2fa)
Date: Mon, 30 Sep 2024 13:33:47 -0000
To: llvm@lists.linux.dev
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.40
Message-Id: <77187.124093009335201123@us-mta-232.us.mimecast.lan>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hi, we tested your kernel and here are the results:

    Overall result: FAILED
             Merge: OK
           Compile: FAILED


Kernel information:
    Commit message: Merge tag 'net-6.12-rc1' of git://git.kernel.org/pub/sc=
m/linux/kernel/git/netdev/net

You can find all the details about the test run at
    https://datawarehouse.cki-project.org/kcidb/checkouts/redhat:1471209508

One or more kernel builds failed:
    Unrecognized or new issues:
         ppc64le - https://datawarehouse.cki-project.org/kcidb/builds/redha=
t:1471209508-ppc64le-kernel
           s390x - https://datawarehouse.cki-project.org/kcidb/builds/redha=
t:1471209508-s390x-kernel
          x86_64 - https://datawarehouse.cki-project.org/kcidb/builds/redha=
t:1471209508-x86_64-kernel
          x86_64 (debug) - https://datawarehouse.cki-project.org/kcidb/buil=
ds/redhat:1471209508-x86_64-kernel-debug


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

