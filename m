Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8C0E18A95B
	for <llvm@lists.linux.dev>; Sun,  3 Nov 2024 20:22:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730665332; cv=none; b=liWZODESE5qGBsJR4vayNQx88yMFdrrjI8DmBi+LGHfkZGPPU9yT3skIy1WE6pkwvQ6VxzZREM1jn/uENjfiIvHikj5WfApveX5kwFpDXUeaT8tanRtuhlwWhKmNqsXNnWqQUDZsnyaE2uHqZusf3yPV2IBxPiEkgmnvKrnjT/w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730665332; c=relaxed/simple;
	bh=+1CBgjupIbnUJYq8tZYh5DKVfOmjbbbt6xpjdvr+foQ=;
	h=From:Subject:Date:To:MIME-Version:Message-Id:Content-Type; b=F7orjiRbe8Hn54P0vQHvEBlqmED8Mi2nORJSWs8IVSXt6Wg+/MOS5wYgrQgvIJITa3sgP+WMpEQHpTkqpIavJCWRUEKquqd9XQ6Ji4DiYsMpPTojE7hTWKt/IGyuq88qL2kpJ9YggNT9TFWSoS1XagfiDvrNaWCzWoPzXuBGg58=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Fe/Xb14I; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Fe/Xb14I"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1730665328;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=L8zZbhRK1e8eRmZADQS2oTRLkSs3ZnrcTatyxHoNYHc=;
	b=Fe/Xb14I5Vwc2y5gi8UWyu6Q22vEFXxzzPKmjapJIfgKVturP8IeWKuhvb4JqMW+HOyEF+
	6MvZnGnTy6JCbkJfwkgFLJcV/Y1TSuNnIxZS8TphGJzfcC5+KruUIW/8q1E557F1JBUXK3
	+3ufK44jNnmnoHy24wpQ5sqr+NMBltQ=
Received: from mx-prod-mc-04.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-510-T4VOXA6WPh-K-qh2bTPBuQ-1; Sun,
 03 Nov 2024 15:22:07 -0500
X-MC-Unique: T4VOXA6WPh-K-qh2bTPBuQ-1
Received: from mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.17])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-04.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 7AEC519560AF
	for <llvm@lists.linux.dev>; Sun,  3 Nov 2024 20:22:06 +0000 (UTC)
Received: from [172.64.2.75] (unknown [10.30.34.59])
	by mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id DC6621956052;
	Sun,  3 Nov 2024 20:22:05 +0000 (UTC)
From: cki-project@redhat.com
Subject: =?utf-8?b?4p2M?= FAIL: Test report for master (6.12.0-rc5,
 upstream-mainline, 886b7e80)
Date: Sun, 03 Nov 2024 20:22:05 -0000
To: llvm@lists.linux.dev
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.17
Message-Id: <86958.124110315220700100@us-mta-510.us.mimecast.lan>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hi, we tested your kernel and here are the results:

    Overall result: FAILED
             Merge: OK
           Compile: FAILED


Kernel information:
    Commit message: Merge tag 'driver-core-6.12-rc6' of git://git.kernel.or=
g/pub/scm/linux/kernel/git/gregkh/driver-core

You can find all the details about the test run at
    https://datawarehouse.cki-project.org/kcidb/checkouts/redhat:1525098498

One or more kernel builds failed:
    Unrecognized or new issues:
         ppc64le - https://datawarehouse.cki-project.org/kcidb/builds/redha=
t:1525098498-ppc64le-kernel
           s390x - https://datawarehouse.cki-project.org/kcidb/builds/redha=
t:1525098498-s390x-kernel
          x86_64 (debug) - https://datawarehouse.cki-project.org/kcidb/buil=
ds/redhat:1525098498-x86_64-kernel-debug


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

