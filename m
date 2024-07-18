Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38C702C1A2
	for <llvm@lists.linux.dev>; Thu, 18 Jul 2024 03:12:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721272333; cv=none; b=chjgkGcsJsmwfZ6kuWhRjJ6aTt7DIAalJOb4479Nhw4DpXFfwkl/k53/noWaCFecGQsuKCYAoVuv5RyNY2GHTf6LACVXY8QDEAwyxjamhbD2EsmAs4QY2vy32VtBBJNWcyr+IYVyV5z7Qe+0EeniIR2wzEvSYUj6Ey4LqC6oyHI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721272333; c=relaxed/simple;
	bh=NXHaetpAYDX+fZlMN1ViDV8OKOEV6wWg14vD3gNt7rA=;
	h=From:Subject:Date:To:MIME-Version:Message-Id:Content-Type; b=a5QxGHwNWrFe/qgX4yQnKDZqnGZvZZmRBJV3o4xJcIVEQIj8nOf4X4CgHrrURmBFWEKk3NSOiF11XSbgb2vaRKFlQTsSGxJS0FgD0me/Ojk+2nZbdkQdESdHQQ9wwBntP3My9eoubtQ1N9iS55DADOEAti1Fe7kpR9OmeK3eU0A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=dW+9S0FA; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="dW+9S0FA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1721272330;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=TVSbMQ3z561Bh2WPPH+9XDl7sZ//Jb2+iABjOFDKD/g=;
	b=dW+9S0FA1Jy/USGlWwwVPzz468Chqcr3wE4zSElZF3ud1l5ZrISBS2FjwalGQz051CYGAD
	hA6hqSbTaQFUmVRQYV7K9nrYtrUBkrFU7JIx8j1FM9up3MYR2pLHNsrq7zUkYDbE7culo+
	OO9HmXXs2g5ZCe8n0gAp/+dBeZzBqnQ=
Received: from mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-624-GFy13zbzMpOzW_8s6CfblQ-1; Wed,
 17 Jul 2024 23:12:05 -0400
X-MC-Unique: GFy13zbzMpOzW_8s6CfblQ-1
Received: from mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.17])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id E861A1955D52
	for <llvm@lists.linux.dev>; Thu, 18 Jul 2024 03:12:04 +0000 (UTC)
Received: from [172.64.10.23] (unknown [10.30.34.11])
	by mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 428391955F40;
	Thu, 18 Jul 2024 03:12:04 +0000 (UTC)
From: cki-project@redhat.com
Subject: =?utf-8?b?4p2M?= FAIL: Test report for master (6.10.0,
 mainline.kernel.org-clang, b1bc554e)
Date: Thu, 18 Jul 2024 03:12:04 -0000
To: llvm@lists.linux.dev
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.17
Message-Id: <87462.124071723120600129@us-mta-624.us.mimecast.lan>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hi, we tested your kernel and here are the results:

    Overall result: FAILED
             Merge: OK
           Compile: FAILED


Kernel information:
    Commit message: Merge tag 'media/v6.11-1' of git://git.kernel.org/pub/s=
cm/linux/kernel/git/mchehab/linux-media

You can find all the details about the test run at
    https://datawarehouse.cki-project.org/kcidb/checkouts/redhat:1378097985

One or more kernel builds failed:
    Unrecognized or new issues:
         ppc64le - https://datawarehouse.cki-project.org/kcidb/builds/redha=
t:1378097985-ppc64le-kernel
           s390x - https://datawarehouse.cki-project.org/kcidb/builds/redha=
t:1378097985-s390x-kernel
          x86_64 (debug) - https://datawarehouse.cki-project.org/kcidb/buil=
ds/redhat:1378097985-x86_64-kernel-debug


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

