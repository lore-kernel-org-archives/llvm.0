Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D443E1EA90
	for <llvm@lists.linux.dev>; Tue, 19 Nov 2024 03:22:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731986531; cv=none; b=AEtfuRADw7i7UNL4AVXAX2aVJugK4/luxZ5yKmpjIJ6qxvT63wicVHY4GBR3rJNQFtcNwCbKIiza3fc6wm/+SvuceIO1WZVx92aD0Sfvu51RHRcVkeeEmiXUCDw7nWd+vxRbxJZkeN0eYZKqJkC6uCOWmnUOTTItw8QniiZZDxk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731986531; c=relaxed/simple;
	bh=xwwviAm44DzSGYKqnNoxb9+WL0JucihnkLSfIUNdjXY=;
	h=From:Subject:Date:To:MIME-Version:Message-Id:Content-Type; b=dROaBdiX5waW5uMp2Jk69sqOja45ATtjX47dD7qbmp/yib9Df2HXRhJ61p0IyQsPBvaHDv79vvIuO2eMi4PZ0B+qmWPkk8rL9WTxuwr64eRPXSv/jK9I2mz+oBE1in3N+5D8LkAXwaJ/aSYE/NbZXmbLvDbO8QC482CzqHpq2Z8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Yj7R105Q; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Yj7R105Q"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1731986528;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=u1N345vPH9poVGQz/Bj5LLMcVP0M7DW6lBXcQKXPeXE=;
	b=Yj7R105Q4s63HmV78YE1DEXYdAalPFkh/pHFc3BvRxCqgUa9JGDShYcJngJ+b77435axKz
	vq5zr+5PnuIT/A1tUJ8mvSb2rRJZc+ORrJJg5QXfAeYyAEktXMgQYMYpya2mDBfGEeyx8y
	p9SHUt7Pzle6NvBw/MVZxbyRssOgkwE=
Received: from mx-prod-mc-04.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-84-2hbijxM5P0C0XOtL7dmMLA-1; Mon,
 18 Nov 2024 22:22:07 -0500
X-MC-Unique: 2hbijxM5P0C0XOtL7dmMLA-1
X-Mimecast-MFC-AGG-ID: 2hbijxM5P0C0XOtL7dmMLA
Received: from mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-04.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 6BFDF1955E75
	for <llvm@lists.linux.dev>; Tue, 19 Nov 2024 03:22:06 +0000 (UTC)
Received: from [172.64.9.62] (unknown [10.30.33.134])
	by mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 5913930001A0;
	Tue, 19 Nov 2024 03:22:05 +0000 (UTC)
From: cki-project@redhat.com
Subject: =?utf-8?b?4p2M?= FAIL: Test report for master (6.12.0,
 upstream-mainline, ba1f9c8f)
Date: Tue, 19 Nov 2024 03:22:05 -0000
To: llvm@lists.linux.dev
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.4
Message-Id: <51208.124111822220701109@us-mta-84.us.mimecast.lan>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: U0AnKfj48CSA6kWYMvYFQrr2bMHosO0hFnpj8dCgF_I_1731986526
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hi, we tested your kernel and here are the results:

    Overall result: FAILED
             Merge: OK
           Compile: FAILED


Kernel information:
    Commit message: Merge tag 'arm64-upstream' of git://git.kernel.org/pub/=
scm/linux/kernel/git/arm64/linux

You can find all the details about the test run at
    https://datawarehouse.cki-project.org/kcidb/checkouts/redhat:1550008382

One or more kernel builds failed:
    Unrecognized or new issues:
         ppc64le - https://datawarehouse.cki-project.org/kcidb/builds/redha=
t:1550008382-ppc64le-kernel
           s390x - https://datawarehouse.cki-project.org/kcidb/builds/redha=
t:1550008382-s390x-kernel
          x86_64 (debug) - https://datawarehouse.cki-project.org/kcidb/buil=
ds/redhat:1550008382-x86_64-kernel-debug


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

