Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD2894A21
	for <llvm@lists.linux.dev>; Sun,  6 Apr 2025 21:22:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743974547; cv=none; b=aD2ze9CMn8W1Gyotv9swHtL37V9cPtDQoOaSELkZ7Rh1QtVkHTXtC13izI3GRfgdM+e7XBeNszZ1346eLXt4QPc9ZzGpoImBqUHB5lYb48g0FL5FeoUz3dMrml5rCn/nbj30jIw5D01Y/5eaFg+j/ivlk1YJBLJ9MgBA09AnjHk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743974547; c=relaxed/simple;
	bh=XghVOoNf6dNRH22NHutT3UdXrdqpkaYu5GWT67NQmTg=;
	h=From:Subject:Date:To:MIME-Version:Message-Id:Content-Type; b=raDsDOArAh7KdYsFFQa8P5J+tnq40o+gs2qyKZq5Y67gg7jG15SELu0mWyWs6HH9VwECZ6s6MYNJsKAjGEHWczhUuvh1tOTwDGY8bg6h8ovTXKPz0torDwsw2eI0Ay76U2/Q6qjWwWvbqCvm8hzkXTqERhdeb7EQeQgH1zanUVk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=VLyMDbpj; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="VLyMDbpj"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1743974536;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=1N0XJoBHgz84HsXpUrrRMI13YM1m0DuB8IqFp0kF7Gw=;
	b=VLyMDbpjenqxqQLYNtEqSbotrj3gw5e6jaWD5wlkSYcTK9GP7i6xYOcb8jg0VvO/526mH/
	ev6CKnBRK9OIugfpteTf7iZOz25n2vH780KvnZ9aulz84n/cqtHSvsw0qq0IRvdcOG2cle
	MZr9OBccGPHpvs81rXbsmjYvaP0nh4o=
Received: from mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-326-YKl957rIM0CgXtxx_vsnbA-1; Sun,
 06 Apr 2025 17:22:09 -0400
X-MC-Unique: YKl957rIM0CgXtxx_vsnbA-1
X-Mimecast-MFC-AGG-ID: YKl957rIM0CgXtxx_vsnbA_1743974525
Received: from mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.93])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 9F49F1955BC1
	for <llvm@lists.linux.dev>; Sun,  6 Apr 2025 21:22:05 +0000 (UTC)
Received: from [172.20.219.140] (unknown [10.30.44.44])
	by mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 3482B180B488;
	Sun,  6 Apr 2025 21:22:04 +0000 (UTC)
From: cki-project@redhat.com
Subject: =?utf-8?b?4p2M?= FAIL: Test report for master (6.14.0,
 upstream-mainline, 0efdedb3)
Date: Sun, 06 Apr 2025 21:22:04 -0000
To: llvm@lists.linux.dev
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.93
Message-Id: <56318.125040617220900223@us-mta-326.us.mimecast.lan>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: MTz57iiWaHV-0maiYqo2iGAlS9V8LGHphg4ZOKyMWcY_1743974525
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hi, we tested your kernel and here are the results:

    Overall result: FAILED
             Merge: OK
           Compile: FAILED


Kernel information:
    Commit message: tools/include: make uapi/linux/types.h usable from asse=
mbly

You can find all the details about the test run at
    https://datawarehouse.cki-project.org/kcidb/checkouts/redhat:1754725605

One or more kernel builds failed:
    Unrecognized or new issues:
          x86_64 (debug) - https://datawarehouse.cki-project.org/kcidb/buil=
ds/redhat:1754725605-x86_64-kernel-debug


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

