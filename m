Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5314B9475
	for <llvm@lists.linux.dev>; Sat, 24 Aug 2024 01:33:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724463194; cv=none; b=KyguuxA50ms4VpBME/coU9b7h6XYGzP1bAgLYlNLuzhXhiCijNo5CsQmm/8EdGzaICLeXmrS8zbUVSBRL+5uNjWfpAQci+aRMc6RvRPAOvDR6WHJmg4U3z+D09c4zP0Gx64TvamWIaXlT2ssBnWSaSwDvYh8jMz4vv93fnvPfco=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724463194; c=relaxed/simple;
	bh=oHdyYf0V1ZbOm6Z00mKeKxh8wrCVZYshwfZQ40X7ckw=;
	h=From:Subject:Date:To:MIME-Version:Message-Id:Content-Type; b=oo91RZRQzyiT+51vpXzxw35rz6+pUEaHWglpWByviKmlPCsg7Pra1xOq1G3WTjPgGWDU2IZRtZ7NVq3t3/tDqJF+kWZghTip17ZK1gLfazQVkXiDheDfPbuuIMO2VcUkoWQDRfVBdnvQHHii8ebUmVP45DQiUbPGOuDJmE9utuo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=GzQtNDS6; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="GzQtNDS6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1724463191;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=S5lXDVIod66FaMeMv4h8HBWlclxU+KSxfUDsmxCtUGk=;
	b=GzQtNDS6PaM/zpGDBQ938y/fnSzRCUVs2qVe9j5SUqCk5VDkI0JNVpcCEv1z8YCJbmeRSj
	s00HT1oIYjlq9v7rJjZwoXgFQj62ynbmHV8Xldwc1OvoZl5kJ82xBdLXk2J9z1Yi0AuaLt
	qX44ZX3wf2ccVU9YSuRCHiUZz/HtvRI=
Received: from mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-352-d2A8z_otO2m57YvgZ5t4dw-1; Fri,
 23 Aug 2024 21:33:09 -0400
X-MC-Unique: d2A8z_otO2m57YvgZ5t4dw-1
Received: from mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 9A37E1955BEE
	for <llvm@lists.linux.dev>; Sat, 24 Aug 2024 01:33:08 +0000 (UTC)
Received: from [172.64.0.35] (unknown [10.30.32.160])
	by mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 5ABA5300019C;
	Sat, 24 Aug 2024 01:33:04 +0000 (UTC)
From: cki-project@redhat.com
Subject: =?utf-8?b?4p2M?= FAIL: Test report for master (6.11.0-rc4,
 mainline.kernel.org-clang, b09f6ca9)
Date: Sat, 24 Aug 2024 01:33:04 -0000
To: llvm@lists.linux.dev
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.4
Message-Id: <73309.124082321330900167@us-mta-352.us.mimecast.lan>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hi, we tested your kernel and here are the results:

    Overall result: FAILED
             Merge: OK
           Compile: FAILED


Kernel information:
    Commit message: Merge tag 'acpi-6.11-rc5' of git://git.kernel.org/pub/s=
cm/linux/kernel/git/rafael/linux-pm

You can find all the details about the test run at
    https://datawarehouse.cki-project.org/kcidb/checkouts/redhat:1425448860

One or more kernel builds failed:
    Unrecognized or new issues:
         ppc64le - https://datawarehouse.cki-project.org/kcidb/builds/redha=
t:1425448860-ppc64le-kernel
           s390x - https://datawarehouse.cki-project.org/kcidb/builds/redha=
t:1425448860-s390x-kernel
          x86_64 (debug) - https://datawarehouse.cki-project.org/kcidb/buil=
ds/redhat:1425448860-x86_64-kernel-debug


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

