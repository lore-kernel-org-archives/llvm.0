Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDCA154765
	for <llvm@lists.linux.dev>; Sat, 16 Nov 2024 20:32:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731789130; cv=none; b=Xo0g8Fas1JiFKwTrLYKTJdjiOzj6vPLg/iFvfEc0tXfTzoDUbi8BvXLqgbD0LUNQ6BMOQoevORWc2G/+oikH8lbjcLdEp4+htjBKs6Kql1HqqwRYdL8rqCgj9KwrlywQyWoMagxTCPZ6YO8GJRxDvqsOxoGtEqdaE/0Ul2x4FkY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731789130; c=relaxed/simple;
	bh=AFi3ZLHh+QJQnt5chLl9xb3gxokz509I1R7yPnjZY1Y=;
	h=From:Subject:Date:To:MIME-Version:Message-Id:Content-Type; b=c3f0wRNnQKZPpzJJF5eED/3p/rh3P0lxfm4zV7t+fKtuwc836bEiKFNk9vsIhKvLJwS94J2HeqivuTiGEaAOwMpBHtHYFZANJFNjYJGF5Wq+TsvJoGtZjVbrmRWvhcvJJMq3SzLHOiJi6nMoTmeM9jsIdIHyIkzsi1CzSdjl+I4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=HUiOeiTD; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="HUiOeiTD"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1731789127;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=npKvxyD1WkkwrIah+4fU4Ki+o4wNCCV4H9T37quRAjs=;
	b=HUiOeiTDUop43g5HrHzTRjUvG6MVefTP2hGwimcRnPu2WaeS/9gssMYwAUUUGcrWaFTmsj
	rxxlVP2Mk//ih/Wnrm7Ic7P+MQ7OOfvjwadsMyP4AriMgbyvfbLk+nvBOfFhKnfOWU8kRk
	ypnzxZ8Bkz0+He4WL7AWrtiM9rIgY0g=
Received: from mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-677-WH5k6y-GMXWpC2wrFJRV0Q-1; Sat,
 16 Nov 2024 15:32:06 -0500
X-MC-Unique: WH5k6y-GMXWpC2wrFJRV0Q-1
X-Mimecast-MFC-AGG-ID: WH5k6y-GMXWpC2wrFJRV0Q
Received: from mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.40])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 6059519560BD
	for <llvm@lists.linux.dev>; Sat, 16 Nov 2024 20:32:05 +0000 (UTC)
Received: from [172.64.11.46] (unknown [10.30.34.132])
	by mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id E1C3E1956054;
	Sat, 16 Nov 2024 20:32:04 +0000 (UTC)
From: cki-project@redhat.com
Subject: =?utf-8?b?4p2M?= FAIL: Test report for master (6.12.0-rc7,
 upstream-mainline, b5a24181)
Date: Sat, 16 Nov 2024 20:32:04 -0000
To: llvm@lists.linux.dev
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.40
Message-Id: <59855.124111615320600199@us-mta-677.us.mimecast.lan>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: v6ObJefK4Ie4zNT6Y0OnquEi88-hJlZx0_13UYRoF4c_1731789125
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hi, we tested your kernel and here are the results:

    Overall result: FAILED
             Merge: OK
           Compile: FAILED


Kernel information:
    Commit message: Merge tag 'trace-ringbuffer-v6.12-rc7-2' of git://git.k=
ernel.org/pub/scm/linux/kernel/git/trace/linux-trace

You can find all the details about the test run at
    https://datawarehouse.cki-project.org/kcidb/checkouts/redhat:1547415969

One or more kernel builds failed:
    Unrecognized or new issues:
         ppc64le - https://datawarehouse.cki-project.org/kcidb/builds/redha=
t:1547415969-ppc64le-kernel
           s390x - https://datawarehouse.cki-project.org/kcidb/builds/redha=
t:1547415969-s390x-kernel
          x86_64 (debug) - https://datawarehouse.cki-project.org/kcidb/buil=
ds/redhat:1547415969-x86_64-kernel-debug


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

