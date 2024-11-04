Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2D9842040
	for <llvm@lists.linux.dev>; Mon,  4 Nov 2024 01:23:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730683390; cv=none; b=XoaFmoT5Wi/YLq6oAX0jhdQN66YLyCDuKiLavSgwM3Xc+kqAwfiH07hm35YBZJKAtZa2AIGP5ZACRPEl1IPy+CwNWl/YCYwO6NaBdRHJYIOPtNWnfQ+hw+fkQptXWeqGAA4USdLDCajsABt1YuguvBE5zA/0nMRoJjPGUMdF+DE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730683390; c=relaxed/simple;
	bh=y8O6rE5/Mh7WjecFfFxlVg4/HU+TYnl25JH8l7KelWU=;
	h=From:Subject:Date:To:MIME-Version:Message-Id:Content-Type; b=jRXbuYqpwkKT6IPqMBK/63XsoVnqTHdWtVeAbUlSO3frPq3ma9fpMXhBask9dENsoIycUPa5FmrmPJHBBkCknXY0Z61eES1UcV652AxcEdDHf84QoG7WQiW0Hlsa7QRBLfCCbXa0IVu6XbtQNxraPM7TKMEUAV8f6t0f0ydgm7I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=gnELpxyB; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="gnELpxyB"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1730683387;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=ZXb81GthUWp1yZoN/lAK4qU2w0VOstnmQzOtT841QOE=;
	b=gnELpxyB5Fxv/YYD5DLczV8Obq53X6nXtDT3+qantIlZRXGG8q2znXJRnpflPAyLh7VEno
	bDzBTwBYq+cWK4hUqfFgx9mvOteZisz8Why//mrcMtZOsWBhh5XuzskMu/bz+QolEluNbI
	+3YTDGXlajzLmf6Y90ERUbmp5W/9P6Y=
Received: from mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-344-a-T_lBImNhGLrEmamy2mlg-1; Sun,
 03 Nov 2024 20:23:06 -0500
X-MC-Unique: a-T_lBImNhGLrEmamy2mlg-1
Received: from mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.40])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 9FDA519560B8
	for <llvm@lists.linux.dev>; Mon,  4 Nov 2024 01:23:05 +0000 (UTC)
Received: from [172.64.2.75] (unknown [10.30.34.59])
	by mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 1056F19560AD;
	Mon,  4 Nov 2024 01:23:04 +0000 (UTC)
From: cki-project@redhat.com
Subject: =?utf-8?b?4p2M?= FAIL: Test report for master (6.12.0-rc6,
 upstream-mainline, 59b723cd)
Date: Mon, 04 Nov 2024 01:23:04 -0000
To: llvm@lists.linux.dev
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.40
Message-Id: <83592.124110320230600677@us-mta-344.us.mimecast.lan>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hi, we tested your kernel and here are the results:

    Overall result: FAILED
             Merge: OK
           Compile: FAILED


Kernel information:
    Commit message: Linux 6.12-rc6

You can find all the details about the test run at
    https://datawarehouse.cki-project.org/kcidb/checkouts/redhat:1525237727

One or more kernel builds failed:
    Unrecognized or new issues:
         ppc64le - https://datawarehouse.cki-project.org/kcidb/builds/redha=
t:1525237727-ppc64le-kernel
           s390x - https://datawarehouse.cki-project.org/kcidb/builds/redha=
t:1525237727-s390x-kernel
          x86_64 (debug) - https://datawarehouse.cki-project.org/kcidb/buil=
ds/redhat:1525237727-x86_64-kernel-debug


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

