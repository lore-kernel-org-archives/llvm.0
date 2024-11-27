Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 886714C80
	for <llvm@lists.linux.dev>; Wed, 27 Nov 2024 00:53:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732668787; cv=none; b=O2hi+klrOENElZ2NCWSGzYnx41yzJBMkdiCPm4gK71kPbJrWngk5NYXs+PyIKLAAP7DAIcxc9+3w5iNhSVKyvaZhVazY7m5zYBAbhKXbGqUhzG2/bs+xDvvZdaxxi0Qf9Uxm/Wm5MG5Yx+G/XMQnkROV933cLGa6h6r4gFgyFfg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732668787; c=relaxed/simple;
	bh=TU5tae1rHUn50iy4yQfraSY+6DJ2xRywowDmMuzy9q0=;
	h=From:Subject:Date:To:MIME-Version:Message-Id:Content-Type; b=mpm7gjC3CW1QY41qCwYKfaVVXOdvXReyukOqZbnICp2GoJFDW8RDWL6anQarZwDDSCdfb/mgt/G5l07XiDNX4jZXo+8EeQ4gEB2j5P/VdYKxoMHBEUMcG9dFOVmpZcmpEaYSwx3L4bmkItuKmqL4Yzs3yaqOCumVMUpqcuYRcGE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=QwldZ+ug; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="QwldZ+ug"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1732668784;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=KKlM3SxYPmDD3cymcSfF52sJUFwVILjMA295psz9Uto=;
	b=QwldZ+ugYgDCuB3XslgzcF3/TBUd/mXsu0iA/5OpvNwa7EuV1t2Y/LaTHib++Y3ULxIItt
	u+RcJ1F0txjTP+TMViX7pSyLzkhr39/e/io6wpdIpozoaC8xRy7uGGrnVm+VUK3BASvpc+
	UtRtA62sot1eKQafd04VGgC8uXF59F0=
Received: from mx-prod-mc-04.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-126-l60ij72yN-i2aBTDL_GCmQ-1; Tue,
 26 Nov 2024 19:53:02 -0500
X-MC-Unique: l60ij72yN-i2aBTDL_GCmQ-1
X-Mimecast-MFC-AGG-ID: l60ij72yN-i2aBTDL_GCmQ
Received: from mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-04.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id CC3E619560A3
	for <llvm@lists.linux.dev>; Wed, 27 Nov 2024 00:53:01 +0000 (UTC)
Received: from [172.64.13.40] (unknown [10.30.32.164])
	by mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 5F68E300019E;
	Wed, 27 Nov 2024 00:53:01 +0000 (UTC)
From: cki-project@redhat.com
Subject: =?utf-8?b?4p2M?= FAIL: Test report for master (6.12.0,
 upstream-mainline, b50ecc5a)
Date: Wed, 27 Nov 2024 00:53:00 -0000
To: llvm@lists.linux.dev
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.4
Message-Id: <65127.124112619530201035@us-mta-126.us.mimecast.lan>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: j_ce8A77R3XbwUhh34e_1MQlAl_txwJiiB9-03fO9SM_1732668782
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hi, we tested your kernel and here are the results:

    Overall result: FAILED
             Merge: OK
           Compile: FAILED


Kernel information:
    Commit message: Merge tag 'perf-tools-for-v6.13-2024-11-24' of git://gi=
t.kernel.org/pub/scm/linux/kernel/git/perf/perf-tools

You can find all the details about the test run at
    https://datawarehouse.cki-project.org/kcidb/checkouts/redhat:1561780229

One or more kernel builds failed:
    Unrecognized or new issues:
         ppc64le - https://datawarehouse.cki-project.org/kcidb/builds/redha=
t:1561780229-ppc64le-kernel
          x86_64 - https://datawarehouse.cki-project.org/kcidb/builds/redha=
t:1561780229-x86_64-kernel
          x86_64 (debug) - https://datawarehouse.cki-project.org/kcidb/buil=
ds/redhat:1561780229-x86_64-kernel-debug


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

