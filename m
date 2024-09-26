Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9E9C4F20C
	for <llvm@lists.linux.dev>; Thu, 26 Sep 2024 14:13:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727359988; cv=none; b=SXTxBdISUTISlta2p9mTKL6L3lqedndzQJ5p7qpDshRiiGLVapWDzM2/2j6LfE2hGtX+O8DDiz8jLmDjP8Cgo+rIyzW8Bs66AOxma8IaV/nNb1EEc0Pyv9XkIOe57Tfd/joC95U01rUZxd9U+6e7mSouwYNW+Y7SoiI1MWglW1A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727359988; c=relaxed/simple;
	bh=SjNILIKH9nehb9Dwi/iZrSG4Ld3P3ZKR80FlNv2g0Tc=;
	h=From:Subject:Date:To:MIME-Version:Message-Id:Content-Type; b=FJGLf6Q0GBWVwE4rxKNYGZzP7hBMpnGPAjBwi7gWQ7c9PsNDar3S3WM5YnW9XDaUsfNKIHeh3JOL2sezN+9jO4fpN1MEWaDouU6bWbWzzKehp9qEa7jtnyP2T+3ugZlNtQVhBGhkVBEm6jgWzMAZ0zaXvjsLoQ+juMap1s+X79E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=U22O8AL4; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="U22O8AL4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1727359985;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=/2EawoH3zHuooLGkqJ72RmRwWtejgNST25hUSRHK7Fs=;
	b=U22O8AL4jsxPsitVJ7VDWA6rcfqtf/9pmCIzf3t55SzP2a0D+9yUS4V/UlsWStdS1zg0L0
	uEgfifoxg05w7Lux2yhrdsx9SlmCXroz+bi7gkK/DoqBuoMHSmBCZvRCnonSvrO3nbF30f
	GbrksddHMOokfK0kKqXUr9dGgPsRlcg=
Received: from mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-295-GqCusxy0NQ2eQrj55YntZA-1; Thu,
 26 Sep 2024 10:13:04 -0400
X-MC-Unique: GqCusxy0NQ2eQrj55YntZA-1
Received: from mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (unknown [10.30.177.17])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id DEE7C1975AF3
	for <llvm@lists.linux.dev>; Thu, 26 Sep 2024 14:13:03 +0000 (UTC)
Received: from [172.64.15.17] (unknown [10.30.34.46])
	by mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 8972B1955DC7;
	Thu, 26 Sep 2024 14:13:03 +0000 (UTC)
From: cki-project@redhat.com
Subject: =?utf-8?b?4p2M?= FAIL: Test report for master (6.11.0,
 mainline.kernel.org-clang, 11a299a7)
Date: Thu, 26 Sep 2024 14:13:03 -0000
To: llvm@lists.linux.dev
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.17
Message-Id: <48411.124092610130401465@us-mta-295.us.mimecast.lan>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hi, we tested your kernel and here are the results:

    Overall result: FAILED
             Merge: OK
           Compile: FAILED


Kernel information:
    Commit message: Merge tag 'for-6.12/block-20240925' of git://git.kernel=
.dk/linux

You can find all the details about the test run at
    https://datawarehouse.cki-project.org/kcidb/checkouts/redhat:1469638673

One or more kernel builds failed:
    Unrecognized or new issues:
         ppc64le - https://datawarehouse.cki-project.org/kcidb/builds/redha=
t:1469638673-ppc64le-kernel
           s390x - https://datawarehouse.cki-project.org/kcidb/builds/redha=
t:1469638673-s390x-kernel
          x86_64 - https://datawarehouse.cki-project.org/kcidb/builds/redha=
t:1469638673-x86_64-kernel
          x86_64 (debug) - https://datawarehouse.cki-project.org/kcidb/buil=
ds/redhat:1469638673-x86_64-kernel-debug


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

