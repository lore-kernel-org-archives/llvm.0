Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD102745F4
	for <llvm@lists.linux.dev>; Wed,  2 Oct 2024 21:02:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727902932; cv=none; b=RelDLHaOxaLMnguMxCroHR8vGmmnc8p1Lol9TwVA49athaBtJZAx9f5JzVsFqRi9/Fc//MVECNPDtkcmebLBWif1SqQvUh8rR0O5rOt+DYX4o1o3FYw5vU7ZBbQx6KX3CKx03gOEB3vam5wJk4VWQQBboMOhfWAZA76k1ugo9lg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727902932; c=relaxed/simple;
	bh=5it3Fy1qGwz7e39eAwIBw+0faZ8oDz6qT1Yb6nMycZ0=;
	h=From:Subject:Date:To:MIME-Version:Message-Id:Content-Type; b=I/iVtonHSvDW+o0P6RGEjQB5xzBTFnw/S0M2HD/MHfBuHFYFMTMAV5tSphg7M+eEYrqa05NbIs+s2LAXEiV/33HZ9Hb1P9EJ/Asn5M1C9+Gof6HUm4Ri49NApN+lPJ+AaL/kk5rOkUVi1d8PsKTb8u6HvdyJ6xopYVoUbMjioEQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Omeu2CYv; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Omeu2CYv"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1727902929;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=YgZd54q03trl/3q4SYV6Ce6uZUNGBejnZCot9Sg4/1U=;
	b=Omeu2CYvVaMAFwoF2rfqkp0uPorSvRn34bGGCcY8dPh0Jf8q9ie3VmANy68XqReNlHaoU/
	Z4iMA2AK5FKBrCHXVCpZW9WAUa/XIns18u1iWqoAB2V3emVPoRhtnKjzRvXnji0RhQozd+
	5mqAmMsNOOZCgpimBwXBe0jnDmjR89A=
Received: from mx-prod-mc-04.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-510-mqMIxtDZPhSGmrpknNcPrA-1; Wed,
 02 Oct 2024 17:02:06 -0400
X-MC-Unique: mqMIxtDZPhSGmrpknNcPrA-1
Received: from mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.40])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-04.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 52D511955F57
	for <llvm@lists.linux.dev>; Wed,  2 Oct 2024 21:02:05 +0000 (UTC)
Received: from [172.64.11.16] (unknown [10.30.34.149])
	by mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id C01351956054;
	Wed,  2 Oct 2024 21:02:04 +0000 (UTC)
From: cki-project@redhat.com
Subject: =?utf-8?b?4p2M?= FAIL: Test report for master (6.12.0-rc1,
 mainline.kernel.org-clang, f23aa4c0)
Date: Wed, 02 Oct 2024 21:02:04 -0000
To: llvm@lists.linux.dev
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.40
Message-Id: <42919.124100217020600500@us-mta-510.us.mimecast.lan>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hi, we tested your kernel and here are the results:

    Overall result: FAILED
             Merge: OK
           Compile: FAILED


Kernel information:
    Commit message: Merge tag 'hid-for-linus-2024090201' of git://git.kerne=
l.org/pub/scm/linux/kernel/git/hid/hid

You can find all the details about the test run at
    https://datawarehouse.cki-project.org/kcidb/checkouts/redhat:1479293372

One or more kernel builds failed:
    Unrecognized or new issues:
         ppc64le - https://datawarehouse.cki-project.org/kcidb/builds/redha=
t:1479293372-ppc64le-kernel
           s390x - https://datawarehouse.cki-project.org/kcidb/builds/redha=
t:1479293372-s390x-kernel
          x86_64 (debug) - https://datawarehouse.cki-project.org/kcidb/buil=
ds/redhat:1479293372-x86_64-kernel-debug


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

