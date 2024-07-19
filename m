Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC8E3C8C7
	for <llvm@lists.linux.dev>; Fri, 19 Jul 2024 23:02:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721430129; cv=none; b=VK031CpXwQ1exe17oG45SkqdPht2mbTZbFZ9ay/4tXN5A8sNxnd4TA6t9Kv6V0SvUJ6BQgAHEhT16za0TYI3ITuhj4Tk1yJvI2WjsFLXFncBSKPOQ3ACY+1Wi6CfQeu05QKLc+EHDmB+Jx8SntVcGoEBcP7BBbUVCiC3FU/egbY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721430129; c=relaxed/simple;
	bh=AszoS7kOGC1Qup5KqxxVFB6RUfgxmlB8W7lrRcnDttA=;
	h=From:Subject:Date:To:MIME-Version:Message-Id:Content-Type; b=o5/r7CBQGNCA7Z4fbnseJUiOiJZoE9WMu5YRleN4kSkDY5hKKzXSYOEvvdRuVicy2QDclNv04zhHvAt1SO1d+r1vMgfzXham/m4380POkdu8pGQnHnEu1b22mxj93Z6Kx2fjMI6SrA/RI3smacEJrhOkMt7sntfrtN+N5ghxl8I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=LDS1AZyA; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="LDS1AZyA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1721430126;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=WvZ6yaQbU3nXVbdC0gx9RuNz3Q20YcbrMT/Y/tqfQfI=;
	b=LDS1AZyAAbzzcXrhBkrMxis73/uUaKZ0haQ6OnETVDYxwrK8nnRJ5fBo6Tl8e2wVa8vWSQ
	WEqCE0VwYLjI47AtspYHQh8zyOuxuw3JXRph846o97NOWsrnKeSVQVJszCvDSnUHXjnn8S
	tsD7dSx9pcuBKbHmtcn5qzh7RFM7YNw=
Received: from mx-prod-mc-04.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-617-KePCMnpDNwmIk6I4f1dPGg-1; Fri,
 19 Jul 2024 19:02:05 -0400
X-MC-Unique: KePCMnpDNwmIk6I4f1dPGg-1
Received: from mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.15])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-04.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 74C0619560B0
	for <llvm@lists.linux.dev>; Fri, 19 Jul 2024 23:02:04 +0000 (UTC)
Received: from [172.64.3.44] (unknown [10.30.33.101])
	by mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id C71C61955D4D;
	Fri, 19 Jul 2024 23:02:03 +0000 (UTC)
From: cki-project@redhat.com
Subject: =?utf-8?b?4p2M?= FAIL: Test report for master (6.10.0,
 mainline.kernel.org-clang, 53a5182c)
Date: Fri, 19 Jul 2024 23:02:03 -0000
To: llvm@lists.linux.dev
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.15
Message-Id: <89297.124071919020500722@us-mta-617.us.mimecast.lan>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hi, we tested your kernel and here are the results:

    Overall result: FAILED
             Merge: OK
           Compile: FAILED


Kernel information:
    Commit message: Merge tag 'for-6.11-tag' of git://git.kernel.org/pub/sc=
m/linux/kernel/git/kdave/linux

You can find all the details about the test run at
    https://datawarehouse.cki-project.org/kcidb/checkouts/redhat:1380969367

One or more kernel builds failed:
    Unrecognized or new issues:
         ppc64le - https://datawarehouse.cki-project.org/kcidb/builds/redha=
t:1380969367-ppc64le-kernel
           s390x - https://datawarehouse.cki-project.org/kcidb/builds/redha=
t:1380969367-s390x-kernel
          x86_64 (debug) - https://datawarehouse.cki-project.org/kcidb/buil=
ds/redhat:1380969367-x86_64-kernel-debug


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

