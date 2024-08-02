Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9776F1ABEAC
	for <llvm@lists.linux.dev>; Fri,  2 Aug 2024 22:52:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722639131; cv=none; b=m/dLg5Ik3OAiC2hoHJ6qh7WKnDotTqOQwjqRR/4WVgP41tF27/2smzDthwfyecq6uIEoNmhVGod3Gx1ZXDNRnnd1o5XY4wyuE2nP5THiGqeb7MB1H2QfsTlqKoKOfV6VQTEbVhi6UhWtiO/SI1DiSVSDVr+TswF83uramxN9imk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722639131; c=relaxed/simple;
	bh=Iya9vgIZfGL6kUhMoCpa7gT2cVL7ivChWw0YZ3AoCSU=;
	h=From:Subject:Date:To:MIME-Version:Message-Id:Content-Type; b=fm5q0cxeIpjHU3PMyNhHf9r10q+vlgPHepj/O98mLidfN2wgmMPsdekXNl/VUN/2dXNd3yKcL4PHMnSlW+NbZ8vok96Lqp912/ADn/utWes8niYHOccP/p5zxDzb6wd/EF+lcou/ra/jTovGjfc8VffTPTEmskEzycI1gfzDye0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Gx4Y54s6; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Gx4Y54s6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1722639128;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=6ohly61SxybtRKg9/e/gdLmdRu2y/VZ9PJSl/QVHgAw=;
	b=Gx4Y54s6O42GvaMrZ3vhPCwqio+vdaiF2S/+KawKLz6ALpr9LQYnjlNHY8wpOModcmGaS+
	WOidXhHi1IKYJaPCo1jToQsTuMrZIJGEYXTQUsWnj4L679AY8lRxGsgCjNvBvlwzzV3ScO
	k7ooAZRxWp7xXYDMTJkasUraP42DfrY=
Received: from mx-prod-mc-02.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-413-wgKUbt5ENQu1TLiktXhFbg-1; Fri,
 02 Aug 2024 18:52:07 -0400
X-MC-Unique: wgKUbt5ENQu1TLiktXhFbg-1
Received: from mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.15])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-02.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 3E1EC1955D42
	for <llvm@lists.linux.dev>; Fri,  2 Aug 2024 22:52:06 +0000 (UTC)
Received: from [172.64.4.38] (unknown [10.30.33.216])
	by mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 8971B1955D42;
	Fri,  2 Aug 2024 22:52:05 +0000 (UTC)
From: cki-project@redhat.com
Subject: =?utf-8?b?4p2M?= FAIL: Test report for master (6.11.0-rc1,
 mainline.kernel.org-clang, 17712b7e)
Date: Fri, 02 Aug 2024 22:52:05 -0000
To: llvm@lists.linux.dev
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.15
Message-Id: <25535.124080218520700191@us-mta-413.us.mimecast.lan>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hi, we tested your kernel and here are the results:

    Overall result: FAILED
             Merge: OK
           Compile: FAILED


Kernel information:
    Commit message: Merge tag 'io_uring-6.11-20240802' of git://git.kernel.=
dk/linux

You can find all the details about the test run at
    https://datawarehouse.cki-project.org/kcidb/checkouts/redhat:1399093886

One or more kernel builds failed:
    Unrecognized or new issues:
         ppc64le - https://datawarehouse.cki-project.org/kcidb/builds/redha=
t:1399093886-ppc64le-kernel
           s390x - https://datawarehouse.cki-project.org/kcidb/builds/redha=
t:1399093886-s390x-kernel
          x86_64 (debug) - https://datawarehouse.cki-project.org/kcidb/buil=
ds/redhat:1399093886-x86_64-kernel-debug


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

