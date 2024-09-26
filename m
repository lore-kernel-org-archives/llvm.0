Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7EF001CA81
	for <llvm@lists.linux.dev>; Thu, 26 Sep 2024 14:13:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727360032; cv=none; b=Vzdy66hwWH3f80Bc2swoeQ9GFPN3lWDSARce77sPPCCC0q4gXz1uTaHHyQUGZqsE3gAj1KPVN9TOnWCQV5/7hWr6DFOY7AvcXZRj/HZMHdM7J+wrUWW2uo+2xBvR4aD2s5bwPtn4hmHieVxv/gwuCvtj1tTqSvG5P6IvUY+j1Uc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727360032; c=relaxed/simple;
	bh=TFxSKqiRzxA7Z6SDFi1fzU8ogkiNpFOWlUCpueTk8Tg=;
	h=From:Subject:Date:To:MIME-Version:Message-Id:Content-Type; b=c5HFAjCh8kV6+PL6JPw2m6nag4D4Ctw0iyU0vBInyH67x6OPnf8FR00z1OZRZ23eG82WRR5MZ2H8PNnL2FiVH17KZ4Y8iWrB5PbGvE7RgWBXKTjxHhWe+ouhsczkdDQ3ECOBNubNzrALa6IQGKPjpJIEzy771y7qUs3dK/1/ufY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=c3knk1LI; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="c3knk1LI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1727360030;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=+54YSbSSjxSQiTkqToL9Rrzn6vGtvltqI9CFSCnU0bI=;
	b=c3knk1LImJjkx/1aZt2XqTA58/AX+Kogpw31XnEhzhpltfVs/+4ZRk1jJOxg+XkbegXFQI
	tcs088Phj13vq/u4022O0R3G+gw8xT5zsV7KrSNGP5oprG/c/a5mNtW/O3S6EyO2MQbEOQ
	1yc3xW/rN4rGVKs+lX2sk9n/my1wM9s=
Received: from mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-458-wupcGR0HNuWqdP-16z2xnA-1; Thu,
 26 Sep 2024 10:13:49 -0400
X-MC-Unique: wupcGR0HNuWqdP-16z2xnA-1
Received: from mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com (unknown [10.30.177.15])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 76F0719300FB
	for <llvm@lists.linux.dev>; Thu, 26 Sep 2024 14:13:48 +0000 (UTC)
Received: from [172.64.15.17] (unknown [10.30.34.46])
	by mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 198211979060;
	Thu, 26 Sep 2024 14:13:47 +0000 (UTC)
From: cki-project@redhat.com
Subject: =?utf-8?b?4p2M?= FAIL: Test report for master (6.11.0,
 mainline.kernel.org-clang, f8eb5bd9)
Date: Thu, 26 Sep 2024 14:13:47 -0000
To: llvm@lists.linux.dev
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.15
Message-Id: <84420.124092610134900697@us-mta-458.us.mimecast.lan>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hi, we tested your kernel and here are the results:

    Overall result: FAILED
             Merge: OK
           Compile: FAILED


Kernel information:
    Commit message: mm: fix build on 32-bit targets without MAX_PHYSMEM_BIT=
S

You can find all the details about the test run at
    https://datawarehouse.cki-project.org/kcidb/checkouts/redhat:1465519332

One or more kernel builds failed:
    Unrecognized or new issues:
         ppc64le - https://datawarehouse.cki-project.org/kcidb/builds/redha=
t:1465519332-ppc64le-kernel
           s390x - https://datawarehouse.cki-project.org/kcidb/builds/redha=
t:1465519332-s390x-kernel
          x86_64 (debug) - https://datawarehouse.cki-project.org/kcidb/buil=
ds/redhat:1465519332-x86_64-kernel-debug


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

