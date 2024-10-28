Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CED157CB6
	for <llvm@lists.linux.dev>; Mon, 28 Oct 2024 00:53:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730076789; cv=none; b=Brijm6R7mvmiKrxwlsNe8CCmlVo27rfM+Lc3b8WiOijLt34DqnI7MTfSF4v0klSjy7ebzgDtR8IJGFPlT6zMiG5mJlrSJKXAC8ps/3oTgKHWM3tR+xTokWVq/UdEnoB0pva1PWYmFW8GjEImGLW/gfFJFbUkk3spzwnsQkPrdQM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730076789; c=relaxed/simple;
	bh=CoCHPRyEsoSQL6EXCkSLlqs2LJDHd7XX9RolgMpFivs=;
	h=From:Subject:Date:To:MIME-Version:Message-Id:Content-Type; b=YeCABC+/wZSYwidOvnf/tMeKXUDniz1jv75KbSOhnLbNbJV8baboPNgNOKT6cULs5t15JYPBLh+AhOz0jpzN/UGkrQrj3RY5hYaKhGF5VU9u7yOpuemNuGRmFrib38TAixe+SgB2VLQDaOZK/H5X7PMDHKR8lxYISUcOSWCcuAU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=cYGlwLTd; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="cYGlwLTd"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1730076786;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=/WypCM9Z0s2/JeDqHtg7umNXGA7Umtb/t83mfuQL2u4=;
	b=cYGlwLTdfw052K1Z0yxhXO96uXQjlKoM/F/FsSfwATQCJYS2EHMlkLN6KiEn8VSnIWjO/L
	WNgP+DA4abJN+giF7Jw7RS3QP9bDFtAIOOsNx3pAr4NZr0fv6b/fXH/9bGtbxapCkplb7Z
	d9q8s/Mmwer75ifjKcgQWjLzz9En3WI=
Received: from mx-prod-mc-04.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-212-jLPK6U87NP-vDEDEbTyh0w-1; Sun,
 27 Oct 2024 20:53:04 -0400
X-MC-Unique: jLPK6U87NP-vDEDEbTyh0w-1
Received: from mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.15])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-04.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id C821519560AD
	for <llvm@lists.linux.dev>; Mon, 28 Oct 2024 00:53:03 +0000 (UTC)
Received: from [172.64.2.86] (unknown [10.30.34.59])
	by mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 72F231956086;
	Mon, 28 Oct 2024 00:53:03 +0000 (UTC)
From: cki-project@redhat.com
Subject: =?utf-8?b?4p2M?= FAIL: Test report for master (6.12.0-rc5,
 mainline.kernel.org-clang, 81983758)
Date: Mon, 28 Oct 2024 00:53:03 -0000
To: llvm@lists.linux.dev
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.15
Message-Id: <52085.124102720530500189@us-mta-212.us.mimecast.lan>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hi, we tested your kernel and here are the results:

    Overall result: FAILED
             Merge: OK
           Compile: FAILED


Kernel information:
    Commit message: Linux 6.12-rc5

You can find all the details about the test run at
    https://datawarehouse.cki-project.org/kcidb/checkouts/redhat:1515606652

One or more kernel builds failed:
    Unrecognized or new issues:
         ppc64le - https://datawarehouse.cki-project.org/kcidb/builds/redha=
t:1515606652-ppc64le-kernel
           s390x - https://datawarehouse.cki-project.org/kcidb/builds/redha=
t:1515606652-s390x-kernel
          x86_64 (debug) - https://datawarehouse.cki-project.org/kcidb/buil=
ds/redhat:1515606652-x86_64-kernel-debug


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

