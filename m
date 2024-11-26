Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4066D51C
	for <llvm@lists.linux.dev>; Tue, 26 Nov 2024 03:42:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732592531; cv=none; b=LMO+cTSI7KcIAnZTWgz0emP8sfFzTQKGJaFJAkygDIiW2SGcENlmBpAE4+6LyUICY5LTPpD6piksn/c6h4pPQKgN9QMDnd7zdUtY8z7Zx5h9Pndp+B3zCt7XlHqs4kdCHqu3HsVwlS2hlnZbM3ltVI2wxotnwskLtK08vHDhBLU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732592531; c=relaxed/simple;
	bh=KhKUcfVb8xLEzZDr3Wuj/nStLFfZufWeZLjY79GB9fM=;
	h=From:Subject:Date:To:MIME-Version:Message-Id:Content-Type; b=WWyKJgRDq46m9UBlH/MN2BZ7sAYkeMTkTMYPe9DU7q3wO/YPid43Q567B4qgyapQGl6Htwz6cIXquGc65HxEgGdO0N5Jkv0SjpKaz/8AhLTwt1Jz3aL/8HR878tGqmWVmxN2HSVYr4+/cf6yxJCgrj7n93JXSIhefTWooPFkLvA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=FKwUktEI; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="FKwUktEI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1732592528;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=Lw9TL2OH+a9ygAunHZIyL88CZ1VZ1UuFaiya4snfAdM=;
	b=FKwUktEIH33cRF9GNmLY1YVlIdP8ZbMNiHQAmZo3SpCdRktfXt8NXJmOUskPOLRnjsOtf3
	k26CGKljWMdj5BW0mRiRrOMdheiIcLwaXWLqOfhDCk3D/AY91FmxLaThm7j1Zz/cgVOUvT
	qU9iJ/hqNSeUJYqrAybCmAcxFOHRPq8=
Received: from mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-486-hO84GRFGO9qdsRPV3dgYzg-1; Mon,
 25 Nov 2024 22:42:06 -0500
X-MC-Unique: hO84GRFGO9qdsRPV3dgYzg-1
X-Mimecast-MFC-AGG-ID: hO84GRFGO9qdsRPV3dgYzg
Received: from mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.12])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id DDFB01956080
	for <llvm@lists.linux.dev>; Tue, 26 Nov 2024 03:42:05 +0000 (UTC)
Received: from [172.64.13.40] (unknown [10.30.32.164])
	by mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 6BA5D195DF81;
	Tue, 26 Nov 2024 03:42:05 +0000 (UTC)
From: cki-project@redhat.com
Subject: =?utf-8?b?4p2M?= FAIL: Test report for master (6.12.0,
 upstream-mainline, 2c22dc1e)
Date: Tue, 26 Nov 2024 03:42:05 -0000
To: llvm@lists.linux.dev
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.12
Message-Id: <24356.124112522420600560@us-mta-486.us.mimecast.lan>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 7CdzI05zc-uIVKkRDAOSVpX16TB9Ys9bpVJH1YwYXhE_1732592526
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hi, we tested your kernel and here are the results:

    Overall result: FAILED
             Merge: OK
           Compile: FAILED


Kernel information:
    Commit message: Merge tag 'mailbox-v6.13' of git://git.kernel.org/pub/s=
cm/linux/kernel/git/jassibrar/mailbox

You can find all the details about the test run at
    https://datawarehouse.cki-project.org/kcidb/checkouts/redhat:1560135092

One or more kernel builds failed:
    Unrecognized or new issues:
         ppc64le - https://datawarehouse.cki-project.org/kcidb/builds/redha=
t:1560135092-ppc64le-kernel
          x86_64 (debug) - https://datawarehouse.cki-project.org/kcidb/buil=
ds/redhat:1560135092-x86_64-kernel-debug


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

