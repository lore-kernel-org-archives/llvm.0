Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C517021A431;
	Fri,  7 Mar 2025 12:52:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.92.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741351957; cv=none; b=dShJavU2AUiHskpy9OL418yABeUIfbKYuWG10rK116kL5k24fTJHA3QqHeeCWy5dJb+5JdYfNPB0RED4hj+IIF3pleZbKB7Kiei6L0WwvYanBy4no0nxg6S955/UPolf0omhK7QZKvwxACfn4uqJxd3dBJ7kxAmzHhejvRbF16U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741351957; c=relaxed/simple;
	bh=c1OsWlwYrt5GePxptVUFT3fF2I9aK75ORPPC159P5rc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MsV0eKadtN4WUHYw3LWQn3RsHD14ahkoZAnxDKxYYxM1y9GIQF4/KQvDAlatcFxn7/MrnaIpigeeIRMHBDAB3Y10dHsBroQ75Cyw4p5Blc9tYkVBZe6+1ytyRG5uNLeODUY378Nbi2FCdjxnZsXI6JJ4vXLRVjmVN9xYQdsOOOE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=IOXjCTlZ; arc=none smtp.client-ip=90.155.92.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="IOXjCTlZ"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=6dcn23/1UPfolik8YgO6MX3NCm1sak2Kc+UR9QQzv4Q=; b=IOXjCTlZPRGBn4hi+V2D28nEcX
	xhkSMdJNKfW5B4wyXE8FOvR1NzHofGx9BiKnFuY0PBu5ufqx0S2cTi7hRr2LharTvRkXT4AhhdHLa
	8PSAXysPoFLCoGeFkveYeNRpv7wRxeJtUlTbd498r0yT1KXvehJNTD75Fi98WVqnQuyHWJDU2IR9R
	4MrSg2rYUjiSqmT7IS9ZAxQgsRjJtqwuPHcnCcBj5UdhsUEkW3wauqpUDz7bZ9jqgmIiauJba7K3D
	3oQ1tby5yJxN4dHPB2ZmN0GgxUsGyX1E51kPcpbH3fMKcbY9Kz0PmyMDzgKJPt06tLt+iGd+FOJXf
	MMv+epAg==;
Received: from 77-249-17-252.cable.dynamic.v4.ziggo.nl ([77.249.17.252] helo=noisy.programming.kicks-ass.net)
	by desiato.infradead.org with esmtpsa (Exim 4.98 #2 (Red Hat Linux))
	id 1tqXBh-00000001Kfb-3aeT;
	Fri, 07 Mar 2025 12:52:26 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id 0AC2530031C; Fri,  7 Mar 2025 13:52:25 +0100 (CET)
Date: Fri, 7 Mar 2025 13:52:25 +0100
From: Peter Zijlstra <peterz@infradead.org>
To: "Puchert, Aaron" <aaron.puchert@sap.com>
Cc: Marco Elver <elver@google.com>, Aaron Ballman <aaron@aaronballman.com>,
	"linux-toolchains@vger.kernel.org" <linux-toolchains@vger.kernel.org>,
	"llvm@lists.linux.dev" <llvm@lists.linux.dev>,
	Bart Van Assche <bvanassche@acm.org>,
	"Paul E. McKenney" <paulmck@kernel.org>,
	Boqun Feng <boqun.feng@gmail.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: Re: Thread Safety Analysis and the Linux kernel
Message-ID: <20250307125225.GP31462@noisy.programming.kicks-ass.net>
References: <CANpmjNPquO=W1JAh1FNQb8pMQjgeZAKCPQUAd7qUg=5pjJ6x=Q@mail.gmail.com>
 <DB7PR02MB36260C79D8CD91925D0D3447E7CB2@DB7PR02MB3626.eurprd02.prod.outlook.com>
 <20250306103752.GE16878@noisy.programming.kicks-ass.net>
 <DB7PR02MB3626056525E95B643D87CBC4E7CA2@DB7PR02MB3626.eurprd02.prod.outlook.com>
 <20250307085204.GJ16878@noisy.programming.kicks-ass.net>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250307085204.GJ16878@noisy.programming.kicks-ass.net>

On Fri, Mar 07, 2025 at 09:52:04AM +0100, Peter Zijlstra wrote:

> Yeah, so IIRC I once proposed a guard that takes a NULL pointer to mean
> not take the lock, but people had a bit of a fit.
> 
> It would've allowed writing the thing like:
> 
> 	{
> 		guard(device)(parent);
> 		device_release_driver(dev);
> 	}

So the below does compile... Greg, how revolted are you? :-)

diff --git a/drivers/base/core.c b/drivers/base/core.c
index 5a1f05198114..7c95e7800b89 100644
--- a/drivers/base/core.c
+++ b/drivers/base/core.c
@@ -4796,33 +4796,30 @@ void device_shutdown(void)
 		spin_unlock(&devices_kset->list_lock);
 
 		/* hold lock to avoid race with probe/release */
-		if (parent)
-			device_lock(parent);
-		device_lock(dev);
-
-		/* Don't allow any more runtime suspends */
-		pm_runtime_get_noresume(dev);
-		pm_runtime_barrier(dev);
-
-		if (dev->class && dev->class->shutdown_pre) {
-			if (initcall_debug)
-				dev_info(dev, "shutdown_pre\n");
-			dev->class->shutdown_pre(dev);
-		}
-		if (dev->bus && dev->bus->shutdown) {
-			if (initcall_debug)
-				dev_info(dev, "shutdown\n");
-			dev->bus->shutdown(dev);
-		} else if (dev->driver && dev->driver->shutdown) {
-			if (initcall_debug)
-				dev_info(dev, "shutdown\n");
-			dev->driver->shutdown(dev);
+		{
+			guard(device_cond)(parent);
+			guard(device)(dev);
+
+			/* Don't allow any more runtime suspends */
+			pm_runtime_get_noresume(dev);
+			pm_runtime_barrier(dev);
+
+			if (dev->class && dev->class->shutdown_pre) {
+				if (initcall_debug)
+					dev_info(dev, "shutdown_pre\n");
+				dev->class->shutdown_pre(dev);
+			}
+			if (dev->bus && dev->bus->shutdown) {
+				if (initcall_debug)
+					dev_info(dev, "shutdown\n");
+				dev->bus->shutdown(dev);
+			} else if (dev->driver && dev->driver->shutdown) {
+				if (initcall_debug)
+					dev_info(dev, "shutdown\n");
+				dev->driver->shutdown(dev);
+			}
 		}
 
-		device_unlock(dev);
-		if (parent)
-			device_unlock(parent);
-
 		put_device(dev);
 		put_device(parent);
 
diff --git a/include/linux/cleanup.h b/include/linux/cleanup.h
index ec00e3f7af2b..bf72fec6f99b 100644
--- a/include/linux/cleanup.h
+++ b/include/linux/cleanup.h
@@ -300,7 +300,7 @@ static __maybe_unused const bool class_##_name##_is_conditional = _is_cond
 #define DEFINE_GUARD_COND(_name, _ext, _condlock) \
 	__DEFINE_CLASS_IS_CONDITIONAL(_name##_ext, true); \
 	EXTEND_CLASS(_name, _ext, \
-		     ({ void *_t = _T; if (_T && !(_condlock)) _t = NULL; _t; }), \
+		     ({ void *_t = (_condlock) ? _T : NULL; _t; }), \
 		     class_##_name##_t _T) \
 	static inline void * class_##_name##_ext##_lock_ptr(class_##_name##_t *_T) \
 	{ return class_##_name##_lock_ptr(_T); }
diff --git a/include/linux/device.h b/include/linux/device.h
index 80a5b3268986..4e7ebbb7fb64 100644
--- a/include/linux/device.h
+++ b/include/linux/device.h
@@ -1046,6 +1046,7 @@ static inline void device_unlock(struct device *dev)
 }
 
 DEFINE_GUARD(device, struct device *, device_lock(_T), device_unlock(_T))
+DEFINE_GUARD_COND(device, _cond, (_T ? (device_lock(_T), true) : false))
 
 static inline void device_lock_assert(struct device *dev)
 {
