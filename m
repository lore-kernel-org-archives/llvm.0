Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8599380BF8
	for <llvm@lists.linux.dev>; Mon, 29 Jul 2024 05:23:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722230589; cv=none; b=EWgEU9Di+v8l9OdTUIeSTuJAU8LSBiEuo4g1QEqp9FVYazAA8i2owkpnLFFxTQ/lRK7yE1H46mDgZFHB7botsFk3ikCwbhtG3Fqxxa1WEKGZ4SfhFx3xq5ioBo+Sl3kMPcmWSYOW3y512AE2fjqpAVKcJa6CZfFCCCt/E1XT0v0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722230589; c=relaxed/simple;
	bh=WD8adLAtfE3mcGvBAAcpn+KN6kyZgu7p55wxCwDiHzQ=;
	h=From:Subject:Date:To:MIME-Version:Message-Id:Content-Type; b=fnMN204t7OfejKqcEupNWDk2BtPPcVg0FzF07H2v4qb8etshwShWFvotJW3qVUaIwMT+Lu5B04Xe1HSvZt2cC+Z4tmIMMNvOfb3RMWB/5bba01NnHyAx/6PukHPEIqdXrTjY/4Gpe9MOKxWoRm0Ii9lC3sxLrtzuWKsMMB6Jdv4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=S5ZYwKG2; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="S5ZYwKG2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1722230586;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=xJawP6BppmSJOV8Kkou8+MNrCHhx6E9kQLjLnM67P7Q=;
	b=S5ZYwKG2PKK1FGQQlkp9np9fApd6aQMncbnVL7msZCaI8HlWg1C5Hyaucy8RNx+RFsoInY
	mG++BLIW6PUIN9HVCuID+5CjBMLAGIgZJdUiKKHqWYQ6yYasmibm3ukaqBF7C93Yqf19Yq
	6zoeKfQEHgQpKHKfT3NNRR7xz8bBMUM=
Received: from mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-627-kbyFGlfaOSGOPl1l2feODw-1; Mon,
 29 Jul 2024 01:23:04 -0400
X-MC-Unique: kbyFGlfaOSGOPl1l2feODw-1
Received: from mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.15])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 9D41A1955BF4
	for <llvm@lists.linux.dev>; Mon, 29 Jul 2024 05:23:03 +0000 (UTC)
Received: from [172.64.13.36] (unknown [10.30.32.93])
	by mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id E42E41955D42;
	Mon, 29 Jul 2024 05:23:02 +0000 (UTC)
From: cki-project@redhat.com
Subject: =?utf-8?b?4p2M?= FAIL: Test report for master (6.11.0-rc1,
 mainline.kernel.org-clang, dc1c8034)
Date: Mon, 29 Jul 2024 05:23:02 -0000
To: llvm@lists.linux.dev
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.15
Message-Id: <68409.124072901230400198@us-mta-627.us.mimecast.lan>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hi, we tested your kernel and here are the results:

    Overall result: FAILED
             Merge: OK
           Compile: FAILED


Kernel information:
    Commit message: minmax: simplify min()/max()/clamp() implementation

You can find all the details about the test run at
    https://datawarehouse.cki-project.org/kcidb/checkouts/redhat:1391428665

One or more kernel builds failed:
    Unrecognized or new issues:
         ppc64le - https://datawarehouse.cki-project.org/kcidb/builds/redha=
t:1391428665-ppc64le-kernel
           s390x - https://datawarehouse.cki-project.org/kcidb/builds/redha=
t:1391428665-s390x-kernel
          x86_64 (debug) - https://datawarehouse.cki-project.org/kcidb/buil=
ds/redhat:1391428665-x86_64-kernel-debug


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

