Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0A113F9C5
	for <llvm@lists.linux.dev>; Wed, 20 Nov 2024 20:02:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732132932; cv=none; b=bapDcLe046ldEW0J3PPAibTPWev/sOfnDEJjtBC/381RBYVnqgcea1LKhOd8anYM3UFqbvCjTjDz63+qrS1nKSe5ltn2j+Vdp8DNYVSH/diUTG++qEtHQI7LpnXCL1RdnkN65zBNl2Uo4pyDPoy9GgaS20fzwx5qMWl00/US8Vc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732132932; c=relaxed/simple;
	bh=Coapnh1ycYPdfBMv4jBNCY+SuEeHbQmLdJNUR3+4rpA=;
	h=From:Subject:Date:To:MIME-Version:Message-Id:Content-Type; b=CZh4KQq5SZpfI5XPoPnQCkmVu/TDsxQHsvUUzhhB8T9HIEe6EKY8IWwpoKUqYMX7CJbhKwV9vatuXBcYqqQ2k8CvyBt4CNMhY7iHUwJ6hgmh+T/A2CLjR5MkPA39/7V2KDbfovGgcC35R5WnZ0L32RcQzyRD/Q7+cy107x1jV/A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=bJMo24rW; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="bJMo24rW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1732132929;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=bcd4BCsi40ioV7UyNGPEBqtpDPYwy5p3/vFw73LpK60=;
	b=bJMo24rWizOEsUi7o/qlRid0c64Pzf2MfkYt/Jt8PWqNnfj0Y09ca819zkR95ZvsObVick
	fo4t+BaiFkOLNqbUxa46sO0pxDrl6TlheSsCMLD2RhbG++pbEm2AJFsb5feI3OlNTQ+xyV
	DlxwU7tD9HWrYEjgVDtnGEtZAnLYfj4=
Received: from mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-594-fELWc5MAO56U9G53Uv_TvQ-1; Wed,
 20 Nov 2024 15:02:08 -0500
X-MC-Unique: fELWc5MAO56U9G53Uv_TvQ-1
X-Mimecast-MFC-AGG-ID: fELWc5MAO56U9G53Uv_TvQ
Received: from mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.17])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 5DF581955EAC
	for <llvm@lists.linux.dev>; Wed, 20 Nov 2024 20:02:07 +0000 (UTC)
Received: from [172.64.9.62] (unknown [10.30.33.134])
	by mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id E16771956056;
	Wed, 20 Nov 2024 20:02:06 +0000 (UTC)
From: cki-project@redhat.com
Subject: =?utf-8?b?4p2M?= FAIL: Test report for master (6.12.0,
 upstream-mainline, 8f7c8b88)
Date: Wed, 20 Nov 2024 20:02:06 -0000
To: llvm@lists.linux.dev
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.17
Message-Id: <26112.124112015020801394@us-mta-594.us.mimecast.lan>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: R1S6KEsBgrPz-B_yD-t_pHea0E8YlRBnh8KNN-yP3t8_1732132927
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hi, we tested your kernel and here are the results:

    Overall result: FAILED
             Merge: OK
           Compile: FAILED


Kernel information:
    Commit message: Merge tag 'sched_ext-for-6.13' of git://git.kernel.org/=
pub/scm/linux/kernel/git/tj/sched_ext

You can find all the details about the test run at
    https://datawarehouse.cki-project.org/kcidb/checkouts/redhat:1553241788

One or more kernel builds failed:
    Unrecognized or new issues:
         ppc64le - https://datawarehouse.cki-project.org/kcidb/builds/redha=
t:1553241788-ppc64le-kernel
           s390x - https://datawarehouse.cki-project.org/kcidb/builds/redha=
t:1553241788-s390x-kernel
          x86_64 (debug) - https://datawarehouse.cki-project.org/kcidb/buil=
ds/redhat:1553241788-x86_64-kernel-debug


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

