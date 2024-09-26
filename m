Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1526C5258
	for <llvm@lists.linux.dev>; Thu, 26 Sep 2024 14:31:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727361117; cv=none; b=LjbNctIy+x7rmXJciVbWo6JpG22ttoKfoGIotFCgCi+TcDNsgRprpWxHYpKvO5NlJqD3CbcvPt3sYN1ykTf4tGTpyuXBnv7+M7Io3LGDevXEgrNqzHn0cLh0REn8nqdYbo2d7twsc2Vlzx86GjJ82JuSoQQMQiVV1rBNnlNS+xM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727361117; c=relaxed/simple;
	bh=D1j9NIGhiAG3gQjItaQAox0BfqRm8sQCALIzCGYZGjg=;
	h=From:Subject:Date:To:MIME-Version:Message-Id:Content-Type; b=e5AbmLC4vn7iAG0rF/VGMsPI29DiGYYD2/6zWRssjwJuBG8YGGm9cJNWvVEyvv8eN7D/ZLZ9s1/1n6C9aj3a4aeCv+VVmoH4bv9Rz9L7gDGJPzXYkpPzyg31RCjwfHK7pCmfhdI1WfIfWI1NPkQkO+OKHPvO31j2cci7oHf/kF4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Odp/UkZq; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Odp/UkZq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1727361115;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=xwLJQaKuo1c1NfVcsl/3u7usDiMgfxTSCBPFdbPAUR4=;
	b=Odp/UkZq0R9sFYwnNbkJLE9hFf2b1HpeTYXp+aHyaJuEvk7Xtsvbnix0hzhODiOAwqQ29B
	KGqSd3hXIb9mpdPCQu7ucR61CVDxI/knwxFOLBnp8+jzSD78bgjdLyfki7c5Y44AR/CaXo
	5t3KcxyXfWHrPqLbHlLFHJaNu8r+iio=
Received: from mx-prod-mc-02.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-594-1JVtF12vOUGlM6C1tpwiFQ-1; Thu,
 26 Sep 2024 10:31:53 -0400
X-MC-Unique: 1JVtF12vOUGlM6C1tpwiFQ-1
Received: from mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (unknown [10.30.177.12])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-02.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 9C51F1936CF0
	for <llvm@lists.linux.dev>; Thu, 26 Sep 2024 14:31:52 +0000 (UTC)
Received: from [172.64.15.17] (unknown [10.30.34.46])
	by mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 1EDAA1954B0E;
	Thu, 26 Sep 2024 14:31:52 +0000 (UTC)
From: cki-project@redhat.com
Subject: =?utf-8?b?4p2M?= FAIL: Test report for master (6.11.0-rc5,
 mainline.kernel.org-clang, 20371ba1)
Date: Thu, 26 Sep 2024 14:31:51 -0000
To: llvm@lists.linux.dev
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.12
Message-Id: <08804.124092610315302194@us-mta-594.us.mimecast.lan>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hi, we tested your kernel and here are the results:

    Overall result: FAILED
             Merge: OK
           Compile: FAILED


Kernel information:
    Commit message: Merge tag 'drm-fixes-2024-08-30' of https://gitlab.free=
desktop.org/drm/kernel

You can find all the details about the test run at
    https://datawarehouse.cki-project.org/kcidb/checkouts/redhat:1433012993

One or more kernel builds failed:
    Unrecognized or new issues:
         ppc64le - https://datawarehouse.cki-project.org/kcidb/builds/redha=
t:1433012993-ppc64le-kernel
           s390x - https://datawarehouse.cki-project.org/kcidb/builds/redha=
t:1433012993-s390x-kernel
          x86_64 (debug) - https://datawarehouse.cki-project.org/kcidb/buil=
ds/redhat:1433012993-x86_64-kernel-debug


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

