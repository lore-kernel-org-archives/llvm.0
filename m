Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DDF756742
	for <llvm@lists.linux.dev>; Sun, 27 Oct 2024 20:22:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730060533; cv=none; b=FjfIGV2pgRp1O5VsC/V4KunbyapNJLNQdwI5KwV/5WphrWPbRCjtLi4bACBacEQ/naPL0JfXCbTtm23gAgYQeg/R9LWyGwFYSp/tUYjv0FGkQKRqs88oDz33KUlpG49XO/60rzaOpsroWAswCDYeuM0VrY+aZUy2zBrf45f15nY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730060533; c=relaxed/simple;
	bh=DCZYA9W+CRIMpvfPf6UWnSJ1EJFU/ggdKpaGahYTGkQ=;
	h=From:Subject:Date:To:MIME-Version:Message-Id:Content-Type; b=WuP7TCmHO309Je5N5zu+8YPgLmUN4nCHzFliNWPnCtN48AOWOL3+2jJ0pP0GHanOc6lizqbRse5C/zxlV1Tv7Jdpq651/X6drGGHiBjaHl34B/Kg5VZW8b4dSRO4mAigfu7f5/breO5MFm1at4XDJUWroRK/XEow+7FZ2+ciuYY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=ScK3HUtg; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="ScK3HUtg"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1730060530;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=N+AIo7XD6Gu0ou343QKdQQnngofTEatvF97iaU5thK8=;
	b=ScK3HUtgt+bw88PvQaqDlJwp4qg9fC0DrxAyy8N1kP0Di4z0xn1k7e0R/b0awwiy4blAwq
	705WeOcuXYO9h4Hnsi5GFXgx6Z35aJSSN/hTsc1ShTS1/JJm2jNOB4o5kg5xIMf7nvB3ud
	VylPZqBlgWKlafnvM24cmvrbZXP//l0=
Received: from mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-306-Om23IAUaMcW_hs9lJ0_JKg-1; Sun,
 27 Oct 2024 16:22:08 -0400
X-MC-Unique: Om23IAUaMcW_hs9lJ0_JKg-1
Received: from mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.40])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id B2B4919560AA
	for <llvm@lists.linux.dev>; Sun, 27 Oct 2024 20:22:07 +0000 (UTC)
Received: from [172.64.2.86] (unknown [10.30.34.59])
	by mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 7CBEE19560AA;
	Sun, 27 Oct 2024 20:22:07 +0000 (UTC)
From: cki-project@redhat.com
Subject: =?utf-8?b?4p2M?= FAIL: Test report for master (6.12.0-rc4,
 mainline.kernel.org-clang, ea1fda89)
Date: Sun, 27 Oct 2024 20:22:07 -0000
To: llvm@lists.linux.dev
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.40
Message-Id: <60800.124102716220800353@us-mta-306.us.mimecast.lan>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hi, we tested your kernel and here are the results:

    Overall result: FAILED
             Merge: OK
           Compile: FAILED


Kernel information:
    Commit message: Merge tag 'x86_urgent_for_v6.12_rc5' of git://git.kerne=
l.org/pub/scm/linux/kernel/git/tip/tip

You can find all the details about the test run at
    https://datawarehouse.cki-project.org/kcidb/checkouts/redhat:1515451913

One or more kernel builds failed:
    Unrecognized or new issues:
         ppc64le - https://datawarehouse.cki-project.org/kcidb/builds/redha=
t:1515451913-ppc64le-kernel
           s390x - https://datawarehouse.cki-project.org/kcidb/builds/redha=
t:1515451913-s390x-kernel
          x86_64 (debug) - https://datawarehouse.cki-project.org/kcidb/buil=
ds/redhat:1515451913-x86_64-kernel-debug


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

