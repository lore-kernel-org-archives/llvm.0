Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7081A848E
	for <llvm@lists.linux.dev>; Sun, 25 Aug 2024 07:23:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724570591; cv=none; b=d9d1r8X80UM8aNyPbrfH4e/Sf21/Qsig0r+gMzEMnI7cmIE/TTAZMZMSeXy6OzMzXoOBS/tGbi+xLDDcAj246Ayp/6bKBxCjr+7ggBvLJGcFSYFhlaRpJuxu0zJJorg+KPwR8sV76zJWzfIsxeMZLgOLMxDPu7ExMb8ieXBYMKw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724570591; c=relaxed/simple;
	bh=2Pc3AQ5hFsKy9LO++BhQEOcxU4JL7Nx3uxDq0SaSzX8=;
	h=From:Subject:Date:To:MIME-Version:Message-Id:Content-Type; b=kPOhdiS0ZStPZP2Ruhhfn/YsIFUonOgGKKtCn/o+BFCESBRwxJ3oHF/eoWerwkEP+er50hx064X/xw5KdM3XyAr97fOGq16pnbLrQtcSTiz/dNS9v4Hm1EgpyZzWqofgTE6YIt2oFSee5rPIezIcpake1zW+afVCpQHqh+TtBCg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=aC5HZVJy; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="aC5HZVJy"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1724570586;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=WfMQ2ecLCexz12D/JusmIh8yiNlEZC3SVePnqEVysO8=;
	b=aC5HZVJy4Z7FewjsCDn0GJuS0LuN3kuNVmMyWNWthnCCdhLvi5MqfrFdAym1riHu7R5UaO
	ZX9+YeGj2FxJHvuB45zxwrIC2ckoWS6YxxdXfTCXJFWtq4BaW0h4+aDWe/QvbTqHwRK8rb
	RD+psHEbQzOwpEQoQkdzkh9RDMT87WQ=
Received: from mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-35-TOrKhJ3KNDqDS15GBqaCmw-1; Sun,
 25 Aug 2024 03:23:04 -0400
X-MC-Unique: TOrKhJ3KNDqDS15GBqaCmw-1
Received: from mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.40])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 6EFE61956095
	for <llvm@lists.linux.dev>; Sun, 25 Aug 2024 07:23:03 +0000 (UTC)
Received: from [172.64.0.35] (unknown [10.30.32.160])
	by mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id C882519560A3;
	Sun, 25 Aug 2024 07:23:02 +0000 (UTC)
From: cki-project@redhat.com
Subject: =?utf-8?b?4p2M?= FAIL: Test report for master (6.11.0-rc4,
 mainline.kernel.org-clang, 72bea05c)
Date: Sun, 25 Aug 2024 07:23:02 -0000
To: llvm@lists.linux.dev
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.40
Message-Id: <48802.124082503230400165@us-mta-35.us.mimecast.lan>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hi, we tested your kernel and here are the results:

    Overall result: FAILED
             Merge: OK
           Compile: FAILED


Kernel information:
    Commit message: Merge tag 'bcachefs-2024-08-24' of git://evilpiepirate.=
org/bcachefs

You can find all the details about the test run at
    https://datawarehouse.cki-project.org/kcidb/checkouts/redhat:1426180605

One or more kernel builds failed:
    Unrecognized or new issues:
         ppc64le - https://datawarehouse.cki-project.org/kcidb/builds/redha=
t:1426180605-ppc64le-kernel
           s390x - https://datawarehouse.cki-project.org/kcidb/builds/redha=
t:1426180605-s390x-kernel
          x86_64 (debug) - https://datawarehouse.cki-project.org/kcidb/buil=
ds/redhat:1426180605-x86_64-kernel-debug


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

