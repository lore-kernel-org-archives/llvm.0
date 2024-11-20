Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA21C442F
	for <llvm@lists.linux.dev>; Wed, 20 Nov 2024 00:42:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732063333; cv=none; b=elyzOWy0n2qblcetMLKvVL9/ECY8UaZ7zb+d64HPNnY2GEnmXPdwXagELSlNoMC1eOKtca2U4jAmWK/irCIOvG5pP0kzvDrMIFdrI7T7Okq68lP8HuVOK+PzgN37e0yQ11QwLzOHAkNkZfVwFrHp/jdg8QuQPj3ll06/RQ3gPKU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732063333; c=relaxed/simple;
	bh=8PTBw03dBxDbieFbiQR5MPNHwIdX5QPCINAn8E5ghkE=;
	h=From:Subject:Date:To:MIME-Version:Message-Id:Content-Type; b=ndfxQm0RIcNAbFOYTvDpO+NCvK/BAX7YWIboAKx8NTF0LvclvBj7/lbI7zLbldXMXChC/SPyFLGvVUP2Y1G15eTzQV3JDgda2Y31MRiiE6ASnS7wPqipYwRaZm7KjNXk74j2KHSxQvz0KvUAxbYx6RSv3MEQw+40N5xyuTK/fzU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Pajlk/j9; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Pajlk/j9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1732063328;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=8DCkIqxCOWHRcWLUvXxsgjEqEqXCpIKWVav7ySWYAH8=;
	b=Pajlk/j9wSRaaxeZ2oI5TWgpvpdJxpMGOomSp7/b7QCm7+YfWS/uK1q7azotMSAMTQlpsk
	jy38eTwmXOKEcfx31Qhe3RSZIZnQT/g+sQXPNtsgztSTQzWeVnwGbT7pM9qif79MZ//3kx
	p/cPKnQqCl/c4+kMx8wXHC9p6CpCZi0=
Received: from mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-332-dUhGlOv5PSeJJjJkknvmcQ-1; Tue,
 19 Nov 2024 19:42:06 -0500
X-MC-Unique: dUhGlOv5PSeJJjJkknvmcQ-1
X-Mimecast-MFC-AGG-ID: dUhGlOv5PSeJJjJkknvmcQ
Received: from mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.12])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 43E41195609E
	for <llvm@lists.linux.dev>; Wed, 20 Nov 2024 00:42:05 +0000 (UTC)
Received: from [172.64.9.62] (unknown [10.30.33.134])
	by mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id C6DE319560A3;
	Wed, 20 Nov 2024 00:42:04 +0000 (UTC)
From: cki-project@redhat.com
Subject: =?utf-8?b?4p2M?= FAIL: Test report for master (6.12.0,
 upstream-mainline, d8d78a90)
Date: Wed, 20 Nov 2024 00:42:04 -0000
To: llvm@lists.linux.dev
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.12
Message-Id: <80322.124111919420600505@us-mta-332.us.mimecast.lan>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: KaNuoxyyK0VexaNvwCA9y2IiCGWY_W9l1K8tg5y90UU_1732063325
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hi, we tested your kernel and here are the results:

    Overall result: FAILED
             Merge: OK
           Compile: FAILED


Kernel information:
    Commit message: Merge tag 'x86_cpu_for_v6.13' of git://git.kernel.org/p=
ub/scm/linux/kernel/git/tip/tip

You can find all the details about the test run at
    https://datawarehouse.cki-project.org/kcidb/checkouts/redhat:1551582167

One or more kernel builds failed:
    Unrecognized or new issues:
         ppc64le - https://datawarehouse.cki-project.org/kcidb/builds/redha=
t:1551582167-ppc64le-kernel
           s390x - https://datawarehouse.cki-project.org/kcidb/builds/redha=
t:1551582167-s390x-kernel
          x86_64 (debug) - https://datawarehouse.cki-project.org/kcidb/buil=
ds/redhat:1551582167-x86_64-kernel-debug


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

