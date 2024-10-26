Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3F61217F2E
	for <llvm@lists.linux.dev>; Sat, 26 Oct 2024 01:23:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729905793; cv=none; b=Y17CnqHyC7FWHJ0QhuKz9YZrivNFFVEy0fZXx8RoIePvT31nqd1yIXzIMuSmcbmy9BqSQC1hYPvG8yefoj8uB5+hjTTgDETbT4c2/sOfKiVsiaUKmRPSFDjovTEnvDXt59H90sFHbtFLcobRvlkrCrnM6SO9p18FbQ0+W/xtHdI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729905793; c=relaxed/simple;
	bh=atJ8cy6fTkosV5BgpMoD1cdNDwmocjgOMmkWUmknDZc=;
	h=From:Subject:Date:To:MIME-Version:Message-Id:Content-Type; b=m15B48GiG9jpizVKO96p85zyya5fQlv6JvZOOGT0nZzIlfGlFhtXtB+kcXmekFbECyGSHgxDGK8D3TxgMTwJ8rt8A1KOH2t4mTNquinr2+jaC1X9NEYPSAM9aiwFxexCwwyIs3oXeq9SRQYUe+zEikSKT8NTAzZxMBdGKGJu/CE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=I7vboWV5; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="I7vboWV5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1729905789;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=zm0x9mY1U7OmOXnfXY90LTHz1ykssQgCL+1Poa4Ks2Y=;
	b=I7vboWV5CacY9H7wxTEwMmdt4GUn+ldedAbLim0RZojfwZGokbXlHqXo/q/IBMRnktzyTu
	9Tgy4o+xoUjAi3yK63LT73m9Vo5qzJM+3F/2WQDGkciWlOHulAd9clE7yCUwPYja5lJC8S
	QLqaQJX2gy+NbxIsPOIi0FPmhE81GTQ=
Received: from mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-257-bEZcK2-SNFiXijLoWcx4DA-1; Fri,
 25 Oct 2024 21:23:08 -0400
X-MC-Unique: bEZcK2-SNFiXijLoWcx4DA-1
Received: from mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.12])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 6A94C195608C
	for <llvm@lists.linux.dev>; Sat, 26 Oct 2024 01:23:07 +0000 (UTC)
Received: from [172.64.2.86] (unknown [10.30.34.59])
	by mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id E910619560A2;
	Sat, 26 Oct 2024 01:23:06 +0000 (UTC)
From: cki-project@redhat.com
Subject: =?utf-8?b?4p2M?= FAIL: Test report for master (6.12.0-rc4,
 mainline.kernel.org-clang, 850925a8)
Date: Sat, 26 Oct 2024 01:23:06 -0000
To: llvm@lists.linux.dev
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.12
Message-Id: <09949.124102521230800239@us-mta-257.us.mimecast.lan>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hi, we tested your kernel and here are the results:

    Overall result: FAILED
             Merge: OK
           Compile: FAILED


Kernel information:
    Commit message: Merge tag '9p-for-6.12-rc5' of https://github.com/marti=
netd/linux

You can find all the details about the test run at
    https://datawarehouse.cki-project.org/kcidb/checkouts/redhat:1513191561

One or more kernel builds failed:
    Unrecognized or new issues:
         ppc64le - https://datawarehouse.cki-project.org/kcidb/builds/redha=
t:1513191561-ppc64le-kernel
           s390x - https://datawarehouse.cki-project.org/kcidb/builds/redha=
t:1513191561-s390x-kernel
          x86_64 (debug) - https://datawarehouse.cki-project.org/kcidb/buil=
ds/redhat:1513191561-x86_64-kernel-debug


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

